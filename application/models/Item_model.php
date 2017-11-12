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


    /**
     * Creates an Item Record
     * @param  String   $item_id    a system generated ID 
     * @return Boolean              TRUE on success
     */
    function create($item_id) {
      
            $data = array(              
                'id'             => $item_id,  
                'name'           => strip_tags($this->input->post('name', TRUE)),  
                'category'       => strip_tags($this->input->post('category', TRUE)),  
                'brand'          => strip_tags($this->input->post('brand', TRUE)),  
                'unit'           => strip_tags($this->input->post('unit', TRUE)),  
                'description'    => strip_tags($this->input->post('desc', TRUE)),  
                'serial'         => strip_tags($this->input->post('serial', TRUE)),
                'actual_price'   => strip_tags($this->input->post('srp', TRUE)),
                'dealer_price'   => strip_tags($this->input->post('dp', TRUE)),
                'critical_level' => strip_tags($this->input->post('critical_level', TRUE))
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

    /**
     * Creates an Item Record
     * @param  String   $item_id    the decrypted ITEM ID
     * @return Boolean              TRUE on success
     */
    function update($item_id) { 

          $filepath = $this->view($item_id)['img'];

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

                $path = checkDir('./uploads/items/'.$item_id.'/'); //the path to upload

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
                'name'           => strip_tags($this->input->post('name', TRUE)),  
                'category'       => strip_tags($this->input->post('category', TRUE)),  
                'brand'          => strip_tags($this->input->post('brand', TRUE)),  
                'unit'           => strip_tags($this->input->post('unit', TRUE)),  
                'description'    => strip_tags($this->input->post('desc', TRUE)),  
                'serial'         => strip_tags($this->input->post('serial', TRUE)),
                'actual_price'   => strip_tags($this->input->post('srp', TRUE)),
                'dealer_price'   => strip_tags($this->input->post('dp', TRUE)),
                'critical_level' => strip_tags($this->input->post('critical_level', TRUE)),
                'img'            => $filepath
             );
       
            
            $this->db->where('id', $item_id);
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
     * Returns a range of array of data as per request
     * - Used by Item/Product List Pagination
     * @param  Int      $limit        The limit of records to be returned
     * @param  Int      $id           The ID of page
     * @param  String   $search       The search query
     * @param  Int      $is_deleted   if deleted record or not
     * @return Array             [description]
     */
    function fetch_items($limit, $id, $search, $is_deleted) {

            if($search) {
              $this->db->like('items.name', $search);
              $this->db->or_like('items.category', $search);
              $this->db->or_like('items.description', $search);
              $this->db->or_like('items.serial', $search);
              $this->db->or_like('items.id', $search);
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
            items.critical_level,
            items.unit,
            SUM(item_inventory.qty) as qty
            ');
            

            $this->db->where('items.is_deleted', $is_deleted);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Counts the number of rows existing 
     * - Used by Pagination
     * @param  String     $search       The Search query
     * @param  Int        $is_deleted   if deleted record or not
     * @return Int         [description]
     */
    function count_items($search, $is_deleted) {
        if($search) {
          $this->db->group_start();
          $this->db->like('name', $search);
          $this->db->or_like('category', $search);
          $this->db->or_like('description', $search);
          $this->db->or_like('serial', $search);
          $this->db->or_like('id', $search);
          $this->db->group_end();
        }

        $this->db->where('is_deleted', $is_deleted);
        return $this->db->count_all_results("items");
    }


    /**
     * Returns an the row array of an item
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function view($item_id) {

             $this->db->select('*');        
             $this->db->where('id', $item_id);          
             $this->db->or_where('serial', $item_id);          
             $this->db->limit(1);

             $query = $this->db->get('items');

             return $query->row_array();
    }


    /**
     * Fetches the Gallery Images of an Item
     * @param  [type] $item_id [description]
     * @return [type]          [description]
     */
    function fetch_gallery($item_id) {
             $this->db->select('*');        
             $this->db->where('item_id', $item_id);              

             $query = $this->db->get('item_gallery');

             return $query->result_array();
    }

    /**
     * Uploads a Gallery Image of an Item
     * @param  [type] $item_id [description]
     * @return [type]          [description]
     */
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

    /**
     * Returns the row array of the Gallery item
     * @param  int    $id   Gallery Item ID
     * @return [type]     [description]
     */
    function view_gallery($id) {
             $this->db->select('*');        
             $this->db->where('id', $id);              

             $query = $this->db->get('item_gallery');

             return $query->row_array();
    }

    /**
     * Deletes the file and row data of the Gallery Item
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function delete_gallery($id) {
            
            $file = $this->view_gallery($id);
            //check if picture exist
            if(filexist($file['img'])) {
              unlink($file['img']);
            }

            return $this->db->delete('item_gallery', array('id' => $id));
    }


    /**
     * Checks the serial of an item if it already exist in the database
     * - used by Form Validation for 
     * @param  [type] $id     the ID of the 
     * @param  [type] $serial [description]
     * @return [type]         [description]
     */
    function check_serial($id, $serial) {

             $this->db->select('*');        
             $this->db->where('id !=', $id);          
             $this->db->where('serial', $serial);          
             $this->db->limit(1);

             $query = $this->db->get('items');

             return $query->row_array();
    }


  /////////////////////////////////////////////////////////////
  /// INVENTORY
  ////////////////////////////////////////////////////////////
  
  /**
     * Returns a range of array of data as per request
     * - Used by Item Inventory List Pagination
     * - Used to return inventory/batches of a specific items 
     * @param  Int      $limit        The limit of records to be returned
     * @param  Int      $id           The ID of page
     * @param  String   $search       The search query
     * @param  Int      $is_deleted   if deleted record or not
     * @param  Int      $item_id      defined if to return inventory/batches of a specific item 
     * @return Array             [description]
    */
  function fetch_inventory_items($limit, $id, $search, $is_deleted, $item_id) {

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


            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->group_by('item_inventory.batch_id');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.serial,
            items.category,
            items.description,
            items.unit,
            items.critical_level,
            item_inventory.batch_id,
            item_inventory.actual_price,
            item_inventory.dealer_price,            
            item_inventory.location,
            item_inventory.qty
            ');
            
            //Returning inventory for a specific item
            if(!is_null($item_id)) {
              $this->db->where('items.id', $item_id);
            }

            $this->db->where('items.is_deleted', $is_deleted);
            $this->db->where('item_inventory.qty >', 0);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("item_inventory");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Counts the number of rows existing 
     * - 
     * - Used by Pagination
     * @param  String     $search       The Search query
     * @param  Int        $is_deleted   if deleted record or not
     * @param  Int        $item_id      defined if to return inventory/batches of a specific item 
     * @return Int         [description]
     */
    function count_inventory_items($search, $is_deleted, $item_id) {
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

        //Returning inventory for a specific item
          if(!is_null($item_id)) {
            $this->db->where('items.id', $item_id);
          }

        $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
        $this->db->where('items.is_deleted', 0);
        return $this->db->count_all_results("item_inventory");
    }


}