<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Inventory_Model extends CI_Model {

    /**
     * Creates or Updates a Batch
     * @param [type] $item     [description]
     * @param [type] $qty      [description]
     * @param [type] $tag      [description]
     * @param [type] $tag_id   [description]
     * @param [type] $location [description]
     * @param [type] $srp      [description]
     * @param [type] $dp       [description]
     */
    function add_inventory($item, $qty, $location, $srp, $dp) {


        $batch = $this->getBatchID($item, $dp, $srp, $location);

        if($batch) {

          //Update Batch
          $data = array(              
                'qty'        => $batch['qty'] + $qty  
             );

            $this->db->where('batch_id', $batch['batch_id']);       
            $this->db->update('item_inventory', $data);    

            return $batch['batch_id'];

        } else {
          //Generate New Batch
          $batch_id = $this->generateBatchID($item, $dp);

          $data = array(              
                'batch_id'        => $batch_id,
                'item_id'         => $item,  
                'qty'             => $qty,  
                'dp'              => $dp,       
                'srp'             => $srp,       
                'location'        => $location       
             );
       
          $this->db->insert('item_inventory', $data);    

          return $batch_id;

        }     

    }


    /**
     * This generates a unique Batch ID with a distinct Pattern
     * 
     * Pattern:
     *    YEARMONTH-DP_CODEITEM-INC_ID      i.e     1710-ABC001-0001
     *    
     * @param  String   $item   the item ID
     * @return String      
     */
    function generateBatchID($item, $dp) {

      $item_id  = getRowID($item);
      $row_id = $this->db->count_all('item_inventory') + 1;

      return date('ym-').prettyID2($item_id,3).'-'.prettyID2($row_id, 4);
    }



    /**
     * Gets Batch Info
     * @param  [type] $item     [description]
     * @param  [type] $dp       [description]
     * @param  [type] $srp      [description]
     * @param  [type] $location [description]
     * @return [type]           [description]
     */
    function getBatchID($item, $dp, $srp, $location) {

      $this->db->where('item_id', $item);
      $this->db->where('dp', $dp);
      $this->db->where('srp', $srp);
      $this->db->where('location', $location);

      $query = $this->db->get('item_inventory');

      return $query->row_array();
    }


    /**
     * Gets Inventory Item Row Information
     * @param  [type] $item_id  [description]
     * @param  [type] $location [description]
     * @return [type]           [description]
     */
    function view_item($batch_id, $location) {

      $this->db->where('batch_id', $batch_id);

      if($location) {
          $this->db->where('location', $location);
      }

      $query = $this->db->get('item_inventory');
      return $query->row_array();
      
    }






    /**
     * ---------------------------------------------------------------------------
     * Pagination and Stuff
     * ---------------------------------------------------------------------------
     */

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

            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->select('
            items.id,
            items.name,
            items.brand,
            items.serial,
            items.category,
            item_inventory.SRP,
            item_inventory.DP,
            items.description,
            items.unit,
            items.critical_level,
            item_inventory.qty,
            item_inventory.location,
            item_inventory.batch_id
            ');
            

            $this->db->where('items.is_deleted', 0);
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("item_inventory");

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
        $this->db->join('items', 'items.id = item_inventory.item_id', 'left');

        return $this->db->count_all_results("item_inventory");
    }



  

}