<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Move_Model extends CI_Model {


    function create($user, $location_from, $location_to, $loc_id) {

        $data = array(                            
                'remarks'       => $this->input->post('remarks'),                
                'location_from' => $location_from,                
                'location_to'   => $location_to,                
                'user'          => $user   
             );
       
           $this->db->insert('move', $data);    

           $move_id = $this->db->insert_id();

           $items = $this->fetch_move_items($loc_id, $user, 0);

           if($items) {

            //Update current export items
              $data = array(              
                'move_id'    => $move_id                    
             );            
              $this->db->where('user', $user);
              $this->db->where('move_id', 0);
              $this->db->update('move_items', $data); 

           } else {
              return false;
           }


           return $move_id;
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


    function autocomplete_items($q, $location) {

            $this->db->group_start();
            $this->db->like('items.name', $q);
            $this->db->or_like('items.description', $q);
            $this->db->or_like('items.serial', $q);
            $this->db->or_like('items.id', $q);
            $this->db->group_end();

            $this->db->select('
            items.id,
            items.name,
            items.unit
              ');

            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->group_by('item_inventory.item_id');
            $this->db->where('item_inventory.location', $location);

            $this->db->limit(15);
            $query = $this->db->get('item_inventory');
            
            return $query->result_array();
    }

    function check_item($item, $location) {

            $this->db->select('
            items.id,
            items.name,
            items.unit
              ');

            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->group_by('item_inventory.item_id');
            $this->db->where('item_inventory.location', $location);
            $this->db->where('item_inventory.item_id', $item);
            $query = $this->db->get('item_inventory');
            
            return $query->row_array();
    }



    // EXPORT ITEMS ////////////////////////////////////////////////////////////////////////////


    /**
     * Adds an item to an export grp / cart
     * @param [type] $item      [description]
     * @param [type] $qty       [description]
     * @param [type] $export_id [description]
     * @param [type] $user      [description]
     */
    function add_item($item, $qty, $loc_id, $user) {

            $data = array(              
                'item_id'     => $item,  
                'loc_id'      => $loc_id,  
                'qty'         => $qty,  
                'user'        => $user               
             );
       
            return $this->db->insert('move_items', $data);    

    }

    function update_item_qty($item, $qty, $loc_id, $move_id, $user) {

            //if $qty > 0 - update row 
            if($qty) {
              
              $data = array(              
                'qty'    => $qty                    
             );
            
              $this->db->where('item_id', $item);
              $this->db->where('user', $user);
              $this->db->where('move_id', $move_id);
              $this->db->where('loc_id', $loc_id);
              return $this->db->update('move_items', $data); 

            } else {
            
              $this->db->where('item_id', $item);
              $this->db->where('user', $user);
              $this->db->where('move_id', $move_id);
              $this->db->where('loc_id', $loc_id);
              return $this->db->delete('move_items'); 

            }     

    }

     function view_item($item, $loc_id, $user) {

            $this->db->select('*');        
            $this->db->where('item_id', $item);
            $this->db->where('user', $user);
            $this->db->where('loc_id', $loc_id);        
            $this->db->limit(1);

            $query = $this->db->get('move_items');

            return $query->row_array();
    }


    /**
     * Items in the Move Cart
     * @param  [type] $location_id [description]
     * @param  [type] $user        [description]
     * @param  [type] $move_id     [description]
     * @return [type]              [description]
     */
    function fetch_move_items($location_id, $user, $move_id) {

            $this->db->join('items', 'items.id = move_items.item_id', 'left');
            $this->db->select('
            move_items.id,
            move_items.qty,
            items.id as item_id,
            items.name,
            items.category,
            items.SRP,
            items.DP,
            items.serial,
            items.unit
            ');          
           
            $this->db->where('move_items.move_id', $move_id);

            if(!is_null($location_id)) {
              $this->db->where('move_items.loc_id', $location_id);     
            }

            if(!is_null($user)) {
              $this->db->where('move_items.user', $user);     
            }

            $query = $this->db->get("move_items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }



  

}