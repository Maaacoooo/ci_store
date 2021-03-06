<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Location_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////


    function create() {
        
            $data = array(              
                'title'  => $this->input->post('title')
             );
       
            return $this->db->insert('item_location', $data);    
    }


    function update($id) { 

            $data = array(                
                'title'           => $this->input->post('title')
             );
       
            
            $this->db->where('id', $id);
            return $this->db->update('item_location', $data);          
        
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
            return $this->db->update('item_location', $data);          

    }


    /**
     * Returns the paginated array of rows 
     * @param  int      $limit      The limit of the results; defined at the controller
     * @param  int      $id         the Page ID of the request. 
     * @return Array        The array of returned rows 
     */
    function fetch_locations($limit, $id, $search, $is_deleted) {

            if($search) {
              $this->db->like('item_location.title', $search);
            }

            $this->db->join('item_inventory', 'item_inventory.location = item_location.title', 'left');
            $this->db->group_by('item_location.id');
            $this->db->select('
                item_location.id,
                item_location.title,
                SUM(item_inventory.qty) as qty,
                COUNT(item_inventory.batch_id) as items
            ');
            

            $this->db->where('item_location.is_deleted', $is_deleted);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("item_location");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_locations($search, $is_deleted) {
        if($search) {
          $this->db->like('title', $search);
        }
        $this->db->where('is_deleted', $is_deleted);
        return $this->db->count_all_results("item_location");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->limit(1);

             $query = $this->db->get('item_location');

             return $query->row_array();
    }


    /**
     * Fetches the quantity of the item in each location
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function fetch_inventory($limit, $id, $location, $search) {

            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->select('
                items.id,
                items.name,
                items.brand,
                items.category,
                items.actual_price,
                items.dealer_price,
                items.serial,
                items.unit,
                items.critical_level,
                item_inventory.batch_id,
                item_inventory.qty
            ');            
            $this->db->limit($limit, (($id-1)*$limit));            

            if($search) {
              $this->db->group_start();
                  $this->db->like('items.name', $search);
                  $this->db->or_like('items.category', $search);
                  $this->db->or_like('items.description', $search);
                  $this->db->or_like('items.serial', $search);
                  $this->db->or_like('items.id', $search);
                  $this->db->or_like('items.brand', $search);    
              $this->db->group_end();          
            }

            $this->db->where('item_inventory.location', $location);
            $this->db->order_by('item_inventory.qty', 'DESC');

            $query = $this->db->get("item_inventory");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    function count_inventory($location, $search) {

        $this->db->join('items', 'items.id = item_inventory.item_id', 'left');

        if($search) {
              $this->db->group_start();
                  $this->db->like('items.name', $search);
                  $this->db->or_like('items.category', $search);
                  $this->db->or_like('items.description', $search);
                  $this->db->or_like('items.serial', $search);
                  $this->db->or_like('items.id', $search);
                  $this->db->or_like('items.brand', $search);    
              $this->db->group_end();          
        }

        $this->db->where('items.is_deleted', 0);
        $this->db->where('item_inventory.location', $location);
        

        return $this->db->count_all_results("item_inventory");
    }


}