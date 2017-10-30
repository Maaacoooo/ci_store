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
    function add_inventory($item, $qty, $tag, $tag_id, $location, $srp, $dp) {


        $batch = $this->getBatchID($item, $dp, $srp, $location);

        if($batch) {

          //Update Batch
          $data = array(              
                'qty'        => $batch['qty'] + $qty  
             );

            $this->db->where('batch_id', $batch['batch_id']);
       
            return $this->db->update('item_inventory', $data);    


        } else {


          //Generate New Batch
          $data = array(              
                'batch_id'        => $this->generateBatchID($item, $dp),
                'item_id'         => $item,  
                'tag'             => $tag,  
                'tag_id'          => $tag_id,  
                'qty'             => $qty,  
                'dealer_price'    => $dp,       
                'actual_price'    => $srp,       
                'location'        => $location       
             );
       
            return $this->db->insert('item_inventory', $data);    


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
      $row_id = $this->db->count_all('item_inventory');

      return date('ym-').prettyID($item_id).'-'.prettyID($row_id, 4);
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