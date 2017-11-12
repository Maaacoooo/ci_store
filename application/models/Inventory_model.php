<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Inventory_Model extends CI_Model {


  function view_inventory($batch_id) {
    $this->db->where('batch_id', $batch_id);
    $query = $this->db->get('item_inventory');

    return $query->row_array();
  }

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
       
            if(!$this->db->update('item_inventory', $data)) {
              return FALSE;
            }    

        } else {

          $batch = $this->generateBatchID($item, $dp); //override batch data

          //Generate New Batch
          $data = array(              
                'batch_id'        => $batch,
                'item_id'         => $item,  
                'qty'             => $qty,  
                'dealer_price'    => $dp,       
                'actual_price'    => $srp,       
                'location'        => $location       
             );
       
            if(!$this->db->insert('item_inventory', $data)) {
              return FALSE;
            }    


        }
        
      return $batch;            

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
      $row_id = $this->db->count_all('item_inventory');

      return date('ym-').num_to_char($dp).prettyID($item_id, 3).'-'.prettyID($row_id + 1, 4);
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
      $this->db->where('dealer_price', $dp);
      $this->db->where('actual_price', $srp);
      $this->db->where('location', $location);

      $query = $this->db->get('item_inventory');

      return $query->row_array();
    } 

}