<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Supplier_model extends CI_Model
{


    function create_supplier() {

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
                'website'       => $this->input->post('web'),                                
                'logo'          => $filename  
             );
       
            return $this->db->insert('supplier', $data);      

    }


    function update_supplier($id) { 

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
                'website'       => $this->input->post('web'),                                
                'logo'          => $filename   
             );
            
            $this->db->where('id', $id);
            return $this->db->update('supplier', $data);          
        
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
            return $this->db->update('supplier', $data);          

    }


    /**
     * Returns the paginated array of rows 
     * @param  int      $limit      The limit of the results; defined at the controller
     * @param  int      $id         the Page ID of the request. 
     * @return Array        The array of returned rows 
     */
    function fetch_suppliers($limit, $id, $search) {

            if($search) {
              $this->db->like('title', $search);
            }

            $this->db->where('is_deleted', 0);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("supplier");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_suppliers($search) {
        if($search) {
          $this->db->like('title', $search);
        }
        $this->db->where('is_deleted', 0);
        return $this->db->count_all_results("supplier");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->or_where('title', $id);                       
             $this->db->limit(1);

             $query = $this->db->get('supplier');

             return $query->row_array();
    }



}