<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Brand_model extends CI_Model
{


    function create_brand() {

      
            $data = array(              
                'title'         => $this->input->post('title'),  
                'web'           => $this->input->post('web')
             );
       
            $this->db->insert('item_brand', $data);

            $create = $this->db->insert_id(); //return the insert ID

            //Process Image Upload
              if($_FILES['img']['name'] != NULL)  {        

                $path = checkDir('./uploads/item_brands/'.$create.'/'); //the path to upload

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
                $this->db->update('item_brand', array('logo' => $filepath), array('id'=>$create));
            
            } 

            return $create;

    }


    function update_brand($id) { 

            $filepath = $this->view($id)['logo']; //gets the old data 

            //Remove Image
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

                $path = checkDir('./uploads/item_brands/'.$id.'/'); //the path to upload

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
                
            }
      
            $data = array(           
                'title'         => $this->input->post('title'),   
                'web'           => $this->input->post('web'),                                
                'logo'          => $filepath   
             );
            
            $this->db->where('id', $id);
            return $this->db->update('item_brand', $data);          
        
    }


        /**
     * Deletes a user record
     * @param  int    $id    the DECODED id of the item.   
     * @return boolean    returns TRUE if success
     */
    function delete_brand($id) {

 
           $data = array(           
                'is_deleted'      => 1
             );
            
            $this->db->where('id', $id);
            return $this->db->update('item_brand', $data);          

    }


     /**
     * Returns the paginated array of rows 
     * @param  int      $limit      The limit of the results; defined at the controller
     * @param  int      $id         the Page ID of the request. 
     * @return Array        The array of returned rows 
     */
    function fetch_brands($limit, $id, $search, $is_deleted) {

            if($search) {
              $this->db->like('item_brand.title', $search);
            }

            $this->db->select('
                item_brand.id,
                item_brand.title,
                item_brand.logo,
                item_brand.web
            ');
            

            $this->db->where('item_brand.is_deleted', $is_deleted);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("item_brand");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_brands($search, $is_deleted) {
        if($search) {
          $this->db->like('title', $search);
        }
        
        $this->db->where('is_deleted', 0);
        $this->db->where('item_brand.is_deleted', $is_deleted);
        return $this->db->count_all_results("item_brand");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->or_where('title', $id);          
             $this->db->limit(1);

             $query = $this->db->get('item_brand');

             return $query->row_array();
    }


    /**
     * Fetches the quantity of the item in each brand
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function fetch_inventory($limit, $id, $brand) {

            $this->db->select('
                items.id,
                items.name,
                items.brand,
                items.category,
                items.actual_price,
                items.dealer_price,
                items.serial,
                items.critical_level,
                items.unit,
            ');            
            $this->db->limit($limit, (($id-1)*$limit));            
            $this->db->where('items.brand', $brand);
            $this->db->where('items.is_deleted', 0);

            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    function count_inventory($brand) {
        $this->db->where('items.is_deleted', 0);
        $this->db->where('items.brand', $brand);
        $this->db->select('items.id'); 
        return $this->db->count_all_results("items");
    }

}