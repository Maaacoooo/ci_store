<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Export_Model extends CI_Model {


    function create($user, $brand) {

        $data = array(              
                'tracking_no' => $this->input->post('track'),                
                'courier'     => $this->input->post('courier'),                
                'remarks'     => $this->input->post('remarks'),                
                'brand'       => $brand,
                'user'        => $user,
                'status'      => 1             
             );
       
           $this->db->insert('exports', $data);    

           $export_id = $this->db->insert_id();

           $items = $this->export_model->fetch_export_items(0, $user);

           if($items) {

            //Update current export items
              $data = array(              
                'export_id'    => $export_id                    
             );            
              $this->db->where('user', $user);
              $this->db->where('export_id', 0);
              $this->db->update('export_items', $data); 

           } else {
              return false;
           }


           return $export_id;
    }


    function update($id) {
          $data = array(              
                'tracking_no' => $this->input->post('track'),                
                'courier'     => $this->input->post('courier'),                
                'remarks'     => $this->input->post('remarks')                      
             );

           $this->db->where('id', $id);
           return $this->db->update('exports', $data);              
    }


    function verify($id) {
          $data = array(                          
                'status'     => 2                   
             );

           $this->db->where('id', $id);
           return $this->db->update('exports', $data);              
    }


    function view($id) {
            $this->db->join('users', 'users.username = exports.user', 'left');
            $this->db->select('
                exports.id,
                exports.courier,
                exports.tracking_no,
                exports.remarks,
                exports.status,
                exports.created_at,
                exports.updated_at,
                exports.brand,
                users.name as user,
                users.username
                
            ');
            $this->db->where('exports.id', $id);
            $query = $this->db->get('exports');

            return $query->row_array();
    }



    function fetch_exports($limit, $id, $search, $brand, $status) {

            if($search) {
              $this->db->group_start();
              $this->db->like('exports.id', $search);
              $this->db->or_like('exports.courier', $search);
              $this->db->or_like('exports.tracking_no', $search);
              $this->db->group_end();
            }

            if($brand) {
              $this->db->where('exports.brand', $brand);
            }

            if($status) {
              $this->db->where('exports.status', $status);
            }  

            $this->db->join('users', 'users.username = exports.user', 'left');
            $this->db->select('
                exports.id,
                exports.courier,
                exports.tracking_no,
                exports.remarks,
                exports.status,
                exports.created_at,
                exports.updated_at,
                exports.brand,
                users.name as user                
            ');
            
            $this->db->order_by('exports.created_at', 'DESC');
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("exports");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_exports($search, $brand, $status) {
        if($search) {
          $this->db->group_start();
          $this->db->like('exports.id', $search);
          $this->db->or_like('exports.courier', $search);
          $this->db->or_like('exports.tracking_no', $search);
          $this->db->group_end();
        }
        if($brand) {
          $this->db->where('exports.brand', $brand);
        }

        if($status) {
           $this->db->where('exports.status', $status);
        } 

        return $this->db->count_all_results("exports");
    }






    // EXPORT ITEMS ////////////////////////////////////////////////////////////////////////////


    /**
     * Adds an item to an export grp / cart
     * @param [type] $item      [description]
     * @param [type] $qty       [description]
     * @param [type] $export_id [description]
     * @param [type] $user      [description]
     */
    function add_item($item, $qty, $export_id, $user) {

            $data = array(              
                'item_id'     => $item,  
                'export_id'   => $export_id,  
                'qty'         => $qty,  
                'user'        => $user               
             );
       
            return $this->db->insert('export_items', $data);    

    }

    function update_item_qty($item, $qty, $export_id, $user) {

            //if $qty > 0 - update row 
            if($qty) {
              
              $data = array(              
                'qty'    => $qty                    
             );
            
              $this->db->where('item_id', $item);
              $this->db->where('user', $user);
              $this->db->where('export_id', $export_id);
              return $this->db->update('export_items', $data); 

            } else {
            
              $this->db->where('item_id', $item);
              $this->db->where('user', $user);
              $this->db->where('export_id', $export_id);
              return $this->db->delete('export_items'); 

            }     

    }

     function view_item($item, $export_id, $user) {

            $this->db->select('*');        
            $this->db->where('item_id', $item);
            $this->db->where('user', $user);
            $this->db->where('export_id', $export_id);        
            $this->db->limit(1);

            $query = $this->db->get('export_items');

            return $query->row_array();
    }


    function fetch_export_items($export_id, $user) {

            $this->db->join('items', 'items.id = export_items.item_id', 'left');
            $this->db->select('
            export_items.id,
            export_items.qty,
            items.id as item_id,
            items.name,
            items.category,
            items.SRP,
            items.DP,
            items.serial,
            items.unit
            ');          
           
            $this->db->where('export_items.export_id', $export_id);
            $this->db->where('export_items.user', $user);      

            $query = $this->db->get("export_items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }



  

}