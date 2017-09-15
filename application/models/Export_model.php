<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Export_Model extends CI_Model {



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

            if($export_id) {              
              $this->db->where('export_items.export_id', $export_id);
            } else {
              $this->db->where('export_items.user', $user);
            }

            $query = $this->db->get("export_items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }



  

}