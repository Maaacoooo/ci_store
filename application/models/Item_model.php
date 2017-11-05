<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Item_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////

   /**
     * Generates ItemID
     * @return String the Distinct Item ID
     */
    function generate_ItemID() {
        $total_rows = $this->db->count_all('items');
        return 'ITEM'.prettyID(($total_rows + 1));  
    }

    function create($brand) {
        
            $item_id = $this->generate_ItemID();

            $data = array(              
                'id'             => $item_id,  
                'name'           => $this->input->post('name'),  
                'category'       => $this->input->post('category'),  
                'brand'          => $brand,  
                'unit'           => $this->input->post('unit'),  
                'description'    => $this->input->post('desc'),  
                'serial'         => $this->input->post('serial'),
                'SRP'            => $this->input->post('srp'),
                'DP'             => $this->input->post('dp'),
                'critical_level' => $this->input->post('critical_level')
             );
       
            $this->db->insert('items', $data);    
            return $item_id;

    }


    function update($id, $brand) { 

            $data = array(                
                'name'           => $this->input->post('name'),  
                'category'       => $this->input->post('category'),  
                'brand'          => $brand,  
                'unit'           => $this->input->post('unit'),  
                'description'    => $this->input->post('desc'),  
                'serial'         => $this->input->post('serial'),
                'critical_level' => $this->input->post('critical_level')
             );
       
            
            $this->db->where('id', $id);
            return $this->db->update('items', $data);          
        
    }


    /**
     * Updates the Prices upon import
     * @param  [type] $id  [description]
     * @param  [type] $srp [description]
     * @param  [type] $dp  [description]
     * @return [type]      [description]
     */
    function update_prices($id, $srp, $dp) { 

            $data = array(                
                'srp'            => $srp,
                'dp'             => $dp
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
    function fetch_items($limit, $id, $search, $brand) {

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

            if($brand) {
              $this->db->where('items.brand', $brand);
            }

            $this->db->join('item_inventory', 'item_inventory.item_id = items.id', 'left');
            $this->db->group_by('items.id');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.serial,
            items.category,
            items.description,
            items.unit,
            items.critical_level,
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
    function count_items($search, $brand) {
        if($search) {
          $this->db->group_start();
          $this->db->like('name', $search);
          $this->db->or_like('category', $search);
          $this->db->or_like('description', $search);
          $this->db->or_like('serial', $search);
          $this->db->or_like('id', $search);
          $this->db->group_end();
        }
        if($brand) {
              $this->db->where('items.brand', $brand);
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

            $this->db->select('
                item_inventory.batch_id,
                item_inventory.location,
                item_inventory.srp,
                item_inventory.dp,
                item_inventory.qty
            ');            

            $this->db->where('item_id', $id);

            $query = $this->db->get("item_inventory");

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
            items.SRP,
            items.DP,
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


    /**
     * Returns the Quantity of a distinct Item in a distinct location
     * @param  [type] $id       [description]
     * @param  [type] $location [description]
     * @return [type]           [description]
     */
    function check_item_inventory($id, $location) {

            $this->db->select('
              item_id,
              SUM(item_inventory.qty) as qty
            ');            

            $this->db->where('item_id', $id);
            $this->db->where('location', $location);

            $query = $this->db->get("item_inventory");
     
            return $query->row_array();
          
            

    }

    /**
     * Fetches Export Data 
     * @param  [type] $item_id [description]
     * @return [type]          [description]
     */
    function fetch_exports($item_id) {
        $this->db->join('exports', 'exports.id = export_items.export_id', 'LEFT');
        $this->db->select('
        exports.id as export_id,
        exports.updated_at,
        export_items.qty,
        export_items.dp,
        export_items.id
        ');
        $this->db->where('exports.status', 4);
        $this->db->where('item_id', $item_id);
        $query= $this->db->get('export_items');

        return $query->result_array();
    }
}