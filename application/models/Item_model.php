<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Item_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////

   /**
     * Generates ItemID
     * @return String the Distinct Item ID
     * SECRET_PRICE_CODE-CATEGORY-BRAND-ITEM_ID
     * ABCD-01-01-00001
     */
    function generate_ItemID($code, $cat, $brand) {

        $total_rows = $this->db->count_all('items');
        return $code.'-'.$cat.'-'.$brand.'-'.prettyID(($total_rows + 1), 5);  
    }

    function create($item_id) {
      
            $data = array(              
                'id'             => $item_id,  
                'name'           => $this->input->post('name'),  
                'category'       => $this->input->post('category'),  
                'brand'          => $this->input->post('brand'),  
                'unit'           => $this->input->post('unit'),  
                'description'    => $this->input->post('desc'),  
                'serial'         => $this->input->post('serial'),
                'actual_price'   => $this->input->post('srp'),
                'dealer_price'   => $this->input->post('dp')
             );

            $create_act = $this->db->insert('items', $data);   


            //Process Image Upload
              if($_FILES['img']['name'] != NULL)  {        

                $path = checkDir('./uploads/items/'.$item_id.'/'); //the path to upload

                $config['upload_path'] = $path;
                $config['allowed_types'] = 'gif|jpg|png'; 
                $config['encrypt_name'] = TRUE;                        

                $this->load->library('upload', $config);
                $this->upload->initialize($config);         
                
                $field_name = "img";
                $this->upload->do_upload($field_name);

                $upload_data = $this->upload->data();

                $filepath = $path . $upload_data['file_name'];

                // Set Watermark ////////////////////////////////////////////////////
                $wm_config['quality'] = '100%';
                $wm_config['wm_text'] = 'Copyright '.APP_NAME.' '.date('Y');
                $wm_config['wm_type'] = 'text';
                $wm_config['wm_font_path'] = './system/fonts/arial.ttf';
                $wm_config['wm_font_size'] = '16';
                $wm_config['wm_font_color'] = 'ffffff';
                $wm_config['wm_vrt_alignment'] = 'bottom';
                $wm_config['wm_hor_alignment'] = 'left';
                $wm_config['source_image'] = $filepath; 
                /////////////////////////////////////////////////////////////////////

                //Update row 
                $this->db->update('items', array('img' => $filepath), array('id'=>$item_id));
            
            } 

            return $create_act;
       

    }


    function update($id) { 

          $filepath = $this->view($id)['img'];

          if($this->input->post('remove_img')) {
            if(filexist($filepath)) {
              unlink($filepath); //removes the file
            }
            $filepath = ''; //set to null
          }

          //Process Image Upload
              if($_FILES['img']['name'] != NULL)  {       

                //remove old img
                if(filexist($filepath)) {
                  unlink($filepath); //removes the file
                } 

                $path = checkDir('./uploads/items/'.$id.'/'); //the path to upload

                $config['upload_path'] = $path;
                $config['allowed_types'] = 'gif|jpg|png'; 
                $config['encrypt_name'] = TRUE;                        

                $this->load->library('upload', $config);
                $this->upload->initialize($config);         
                
                $field_name = "img";
                $this->upload->do_upload($field_name);

                $upload_data = $this->upload->data();

                $filepath = $path . $upload_data['file_name']; //overwrite variable

                 // Set Watermark ////////////////////////////////////////////////////
                $wm_config['quality'] = '100%';
                $wm_config['wm_text'] = 'Copyright '.APP_NAME.' '.date('Y');
                $wm_config['wm_type'] = 'text';
                $wm_config['wm_font_path'] = './system/fonts/arial.ttf';
                $wm_config['wm_font_size'] = '16';
                $wm_config['wm_font_color'] = 'ffffff';
                $wm_config['wm_vrt_alignment'] = 'bottom';
                $wm_config['wm_hor_alignment'] = 'left';
                $wm_config['source_image'] = $filepath; 
                /////////////////////////////////////////////////////////////////////
            
            } 

            $data = array(                
                'name'           => $this->input->post('name'),  
                'category'       => $this->input->post('category'),  
                'brand'          => $this->input->post('brand'),  
                'unit'           => $this->input->post('unit'),  
                'description'    => $this->input->post('desc'),  
                'serial'         => $this->input->post('serial'),
                'actual_price'    => $this->input->post('srp'),
                'dealer_price'   => $this->input->post('dp'),
                'img'            => $filepath
             );
       
            
            $this->db->where('id', $id);
            return $this->db->update('items', $data);          
        
    }


        /**
     * Deletes a user record
     * @param  int    $id    the DECODED id of the item.   
     * @return boolean    returns TRUE if success
     */
    function delete($id) {

 
           $data = array(           
                'is_deleted'      => 1
             );
            
            $this->db->where('id', $id);
            return $this->db->update('items', $data);          

    }


    /**
     * Returns the paginated array of rows 
     * @param  int      $limit      The limit of the results; defined at the controller
     * @param  int      $id         the Page ID of the request. 
     * @return Array        The array of returned rows 
     */
    function fetch_items($limit, $id, $search) {

            if($search) {
              $this->db->like('items.name', $search);
              $this->db->or_like('items.category', $search);
              $this->db->or_like('items.description', $search);
              $this->db->or_like('items.serial', $search);
              $this->db->or_like('items.id', $search);
                if($brand) {
                  $this->db->having('items.brand', $brand);
              }
            }


            $this->db->join('item_inventory', 'item_inventory.item_id = items.id', 'left');
            $this->db->group_by('items.id');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.serial,
            items.category,
            items.actual_price,
            items.dealer_price,
            items.description,
            items.unit,
            SUM(item_inventory.qty) as qty
            ');
            

            $this->db->where('items.is_deleted', 0);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_items($search) {
        if($search) {
          $this->db->group_start();
          $this->db->like('name', $search);
          $this->db->or_like('category', $search);
          $this->db->or_like('description', $search);
          $this->db->or_like('serial', $search);
          $this->db->or_like('id', $search);
          $this->db->group_end();
        }

        $this->db->where('is_deleted', 0);
        return $this->db->count_all_results("items");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->or_where('serial', $id);          
             $this->db->limit(1);

             $query = $this->db->get('items');

             return $query->row_array();
    }

    function fetch_gallery($item_id) {
             $this->db->select('*');        
             $this->db->where('item_id', $item_id);              

             $query = $this->db->get('item_gallery');

             return $query->result_array();
    }

    function upload_gallery($item_id) {

        //Process Image Upload
        if($_FILES['img']['name'] != NULL)  {       


                $path = checkDir('./uploads/items/'.$item_id.'/gallery/'); //the path to upload

                $upl_config['upload_path'] = $path;
                $upl_config['allowed_types'] = 'gif|jpg|png'; 
                $upl_config['encrypt_name'] = TRUE;                        

                $this->load->library('upload', $upl_config);
                $this->upload->initialize($upl_config);         
                
                $field_name = "img";
                $this->upload->do_upload($field_name);

                $upload_data = $this->upload->data();

                $filepath = $path . $upload_data['file_name']; //overwrite variable

                $data = array(              
                'item_id' => $item_id,  
                'img'     => $filepath  
             );

            // Set Watermark ////////////////////////////////////////////////////
            $wm_config['quality'] = '100%';
            $wm_config['wm_text'] = 'Copyright '.APP_NAME.' '.date('Y');
            $wm_config['wm_type'] = 'text';
            $wm_config['wm_font_path'] = './system/fonts/arial.ttf';
            $wm_config['wm_font_size'] = '16';
            $wm_config['wm_font_color'] = 'ffffff';
            $wm_config['wm_vrt_alignment'] = 'bottom';
            $wm_config['wm_hor_alignment'] = 'left';
            $wm_config['source_image'] = $filepath; 
            /////////////////////////////////////////////////////////////////////

            $this->image_lib->initialize($wm_config);            
            $this->image_lib->watermark();

            return $this->db->insert('item_gallery', $data);   
            
        }
        return false; 

    }

    function view_gallery($id) {
             $this->db->select('*');        
             $this->db->where('id', $id);              

             $query = $this->db->get('item_gallery');

             return $query->row_array();
    }

    function delete_gallery($id) {
            
            $file = $this->view_gallery($id);
            //check if picture exist
            if(filexist($file['img'])) {
              unlink($file['img']);
            }

            return $this->db->delete('item_gallery', array('id' => $id));
    }



    function check_serial($id, $serial) {

             $this->db->select('*');        
             $this->db->where('id !=', $id);          
             $this->db->where('serial', $serial);          
             $this->db->limit(1);

             $query = $this->db->get('items');

             return $query->row_array();
    }


    /**
     * Fetches the quantity of the item in each location
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function fetch_item_inventory($id) {

            $this->db->join('item_inventory', 'item_inventory.location = item_location.title', 'left');
            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->group_by('item_location.id');
            $this->db->select('
                item_location.title,
                SUM(item_inventory.qty) as qty
            ');            

            $this->db->where('items.id', $id);

            $query = $this->db->get("item_location");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }


    function total_inventory() {

            $this->db->join('item_inventory', 'item_inventory.item_id = items.id', 'left');
            $this->db->group_by('items.id');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.category,
            items.actual_price,
            items.dealer_price,
            items.serial,
            items.unit,
            SUM(item_inventory.qty) as qty
            ');
            

            $this->db->where('items.is_deleted', 0);
            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }


    //////////////
    // HELPERS

    function fetch_brand() {

            $this->db->select('*');
            $this->db->where('is_deleted', 0);
            $query = $this->db->get('item_brand');

            return $query->result_array();

    }


    function fetch_category() {

            $this->db->select('*');
            $this->db->where('is_deleted', 0);
            $query = $this->db->get('item_category');

            return $query->result_array();

    }


    function fetch_unit() {

            $this->db->select('*');
            $this->db->where('is_deleted', 0);
            $query = $this->db->get('item_unit');

            return $query->result_array();

    }


    function search($q, $brand){
            
            if($brand) {
              $this->db->having('brand', $brand);
            }
            $this->db->like('name', $q);
            $this->db->or_like('description', $q);
            $this->db->or_like('serial', $q);
            $this->db->or_like('id', $q);

            $this->db->limit(15);
            $query = $this->db->get('items');
            
            return $query->result_array();
  }
}