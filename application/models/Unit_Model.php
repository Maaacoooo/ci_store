<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Unit_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////


    function create() {
        
            $data = array(              
                'title'  => $this->input->post('title')
             );
       
            return $this->db->insert('item_unit', $data);    
    }


    function update($id) { 

            $data = array(                
                'title'           => $this->input->post('title')
             );
       
            
            $this->db->where('id', $id);
            return $this->db->update('item_unit', $data);          
        
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
            return $this->db->update('item_unit', $data);          

    }


    /**
     * Returns the paginated array of rows 
     * @param  int      $limit      The limit of the results; defined at the controller
     * @param  int      $id         the Page ID of the request. 
     * @return Array        The array of returned rows 
     */
    function fetch_units($limit, $id, $search, $is_deleted) {

            if($search) {
              $this->db->like('item_unit.title', $search);
            }

            $this->db->select('
                item_unit.id,
                item_unit.title
            ');
            

            $this->db->where('is_deleted', $is_deleted);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("item_unit");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_units($search, $is_deleted) {
        if($search) {
          $this->db->like('title', $search);
        }
        $this->db->where('is_deleted', $is_deleted);
        return $this->db->count_all_results("item_unit");
    }


    function view($id) {

             $this->db->select('*');        
             $this->db->where('id', $id);          
             $this->db->limit(1);

             $query = $this->db->get('item_unit');

             return $query->row_array();
    }


    /**
     * Fetches the quantity of the item in each category
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    function fetch_inventory($limit, $id, $unit) {

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
            $this->db->where('items.unit', $unit);
            $this->db->where('items.is_deleted', 0);

            $query = $this->db->get("items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    function count_inventory($unit) {
        $this->db->where('items.is_deleted', 0);
        $this->db->where('items.unit', $unit);
        $this->db->select('items.id'); 
        return $this->db->count_all_results("items");
    }


}