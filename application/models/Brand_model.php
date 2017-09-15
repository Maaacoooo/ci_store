<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Brand_model extends CI_Model
{


    function create_brand() {

            $filename = ''; //img filename empty if not present

            //Process Image Upload
              if($_FILES['img']['name'] != NULL)  {        

                $config['upload_path'] = './uploads/';
                $config['allowed_types'] = 'gif|jpg|png'; 
                $config['encrypt_name'] = TRUE;                        

                $this->load->library('upload', $config);
                $this->upload->initialize($config);         
                
                $field_name = "img";
                $this->upload->do_upload($field_name);
                $data2 = array('upload_data' => $this->upload->data());
                foreach ($data2 as $key => $value) {     
                  $filename = $value['file_name'];
                }
                
            }
      
            $data = array(              
                'title'         => $this->input->post('title'),  
                'address'       => $this->input->post('address'),  
                'description'   => $this->input->post('desc'),  
                'email'         => $this->input->post('email'),  
                'contact'       => $this->input->post('contact'),  
                'web'           => $this->input->post('web'),                                
                'logo'          => $filename  
             );
       
            return $this->db->insert('item_brand', $data);      

    }


    function update_brand($id) { 

            $filename = $this->view($id)['logo']; //gets the old data 

            //Process Image Upload
              if($_FILES['img']['name'] != NULL)  { 


                //Deletes the old photo
                if(!filexist($filename)) {
                  unlink('./uploads/'.$filename); 
                }

                $config['upload_path'] = './uploads/';
                $config['allowed_types'] = 'gif|jpg|png'; 
                $config['encrypt_name'] = TRUE;                        

                $this->load->library('upload', $config);
                $this->upload->initialize($config);         
                
                $field_name = "img";
                $this->upload->do_upload($field_name);
                $data2 = array('upload_data' => $this->upload->data());
                foreach ($data2 as $key => $value) {     
                  $filename = $value['file_name'];
                }
                
            }
      
            $data = array(           
                'title'         => $this->input->post('title'),  
                'address'       => $this->input->post('address'),  
                'description'   => $this->input->post('desc'),  
                'email'         => $this->input->post('email'),  
                'contact'       => $this->input->post('contact'),  
                'web'           => $this->input->post('web'),                                
                'logo'          => $filename   
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
    function fetch_brands($limit, $id, $search) {

            if($search) {
              $this->db->like('title', $search);
              $this->db->or_like('description', $search);
              $this->db->or_like('address', $search);
              $this->db->or_like('email', $search);
              $this->db->or_like('web', $search);
            }

            $this->db->where('is_deleted', 0);
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
    function count_brands($search) {
        if($search) {
          $this->db->like('title', $search);
          $this->db->or_like('description', $search);
          $this->db->or_like('address', $search);
          $this->db->or_like('email', $search);
          $this->db->or_like('web', $search);
        }
        $this->db->where('is_deleted', 0);
        return $this->db->count_all_results("item_brand");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->limit(1);

             $query = $this->db->get('item_brand');

             return $query->row_array();
    }



    function fetch_brands_item($limit, $id, $brand) {
            $this->db->where('brand', $brand);
            $this->db->where('is_deleted', 0);
            $this->db->limit($limit, (($id-1)*$limit));

            $this->db->join('item_inventory', 'item_inventory.item_id = items.id', 'left');
            $this->db->group_by('items.id');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.category,
            items.SRP,
            items.DP,
            items.serial,
            items.unit,
            SUM(item_inventory.qty) as qty
            ');

            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    function count_brands_item($brand) {
        $this->db->where('is_deleted', 0);
        $this->db->where('brand', $brand);
        return $this->db->count_all_results("items");
    }



}