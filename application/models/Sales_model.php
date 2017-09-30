<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Sales_Model extends CI_Model {


    function create($user) {

            $data = array(              
                'customer'        => $this->input->post('customer'),                
                'location'        => $this->input->post('location'),                
                'remarks'         => $this->input->post('remarks'),                
                'amount_tendered' => $this->input->post('amt_tendered'),                
                'user'            => $user,
                'status'          => 1             
             );
       
           $this->db->insert('sales', $data);    

           $sale_id = $this->db->insert_id();

           $items = $this->fetch_sale_items(0, $user);

           if($items) {

            //Minus from Inventory
            foreach ($items as $i) {
              $this->add_inventory($i['item_id'], ($i['qty']*-1), 'sale', $sale_id, $this->input->post('location'));
            }

            //Update current sale items
              $data = array(              
                'sale_id'    => $sale_id                    
             );            
              $this->db->where('user', $user);
              $this->db->where('sale_id', 0);
              $this->db->update('sale_items', $data); 

           } else {
              return false;
           }


           return $sale_id;
    }





    function view($id) {
            $this->db->join('users', 'users.username = sales.user', 'left');        
            $this->db->select('
                sales.id,
                sales.customer,
                sales.remarks,
                sales.location,
                sales.created_at,
                sales.updated_at,
                sales.amount_tendered,
                users.name as user
            ');
            $this->db->where('sales.id', $id);
            $query = $this->db->get('sales');

            return $query->row_array();
    }



    function fetch_sales($limit, $id, $search, $date) {

            if($search) {
              $this->db->like('sales.customer', $search);
            }

            $this->db->join('users', 'users.username = sales.user', 'left');
            $this->db->join('sale_items', 'sale_items.sale_id = sales.id', 'left');
            $this->db->select('
                sales.id,
                sales.status,
                sales.created_at,
                sales.updated_at,
                sales.amount_tendered,
                sales.customer,
                users.name as user,
                SUM((sale_items.srp * sale_items.qty) - (sale_items.discount * sale_items.qty)) as totalAmt                
            ');

            if(($date)) {
               $arr_date = (explode("-",$date));
               $str_from = str_replace(" ", "", ($arr_date[0]));
               $str_to = str_replace(" ", "", ($arr_date[1]));

               $arr_from = explode('/', $str_from);
               $from = $arr_from[2].'-'.$arr_from[0].'-'.$arr_from[1];

               $arr_to = explode('/', $str_to);
               $to = $arr_to[2].'-'.$arr_to[0].'-'.$arr_to[1] . ' 23:59:59';
               $this->db->where('sales.created_at BETWEEN "'.$from.'" AND "'.$to.'"');

            }
            
            $this->db->order_by('sales.created_at', 'DESC');
            $this->db->group_by('sales.id', 'DESC');
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("sales");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_sales($search, $date) {

        if($search) {
              $this->db->like('sales.customer', $search);
        }

         if(($date)) {
               $arr_date = (explode("-",$date));
               $str_from = str_replace(" ", "", ($arr_date[0]));
               $str_to = str_replace(" ", "", ($arr_date[1]));

               $arr_from = explode('/', $str_from);
               $from = $arr_from[2].'-'.$arr_from[0].'-'.$arr_from[1];

               $arr_to = explode('/', $str_to);
               $to = $arr_to[2].'-'.$arr_to[0].'-'.$arr_to[1] . ' 23:59:59';
               $this->db->where('sales.created_at BETWEEN "'.$from.'" AND "'.$to.'"');

            }
        return $this->db->count_all_results("sales");
    }






    // IMPORT ITEMS ////////////////////////////////////////////////////////////////////////////


    /**
     * Adds an item to an import grp / cart
     * @param [type] $item      [description]
     * @param [type] $qty       [description]
     * @param [type] $export_id [description]
     */
    function add_item($item, $qty, $sale_id, $srp, $user) {

            $data = array(              
                'item_id'     => $item,  
                'sale_id'     => $sale_id,  
                'qty'         => $qty,         
                'srp'         => $srp,         
                'user'        => $user         
             );
       
            return $this->db->insert('sale_items', $data);    

    }

    function update_item_qty($item, $qty, $discount, $sale_id, $user) {

            //if $qty > 0 - update row 
            if($qty) {
              
              $data = array(              
                'qty'         => $qty,                    
                'discount'    => $discount                    
             );
              
              if (!is_null($user)) {
                $this->db->where('sale_items.user', $user);
              }
              $this->db->where('item_id', $item);
              $this->db->where('sale_id', $sale_id);
              return $this->db->update('sale_items', $data); 

            } else {
            
              if (!is_null($user)) {
                $this->db->where('sale_items.user', $user);
              }
              $this->db->where('item_id', $item);
              $this->db->where('sale_id', $sale_id);
              return $this->db->delete('sale_items'); 

            }     

    }

     function view_item($item, $sale_id, $user) {

            $this->db->select('*');        
            if (!is_null($user)) {
                $this->db->where('sale_items.user', $user);
            }
            $this->db->where('item_id', $item);
            $this->db->where('sale_id', $sale_id);        
            $this->db->limit(1);

            $query = $this->db->get('sale_items');

            return $query->row_array();
    }


    function fetch_sale_items($sale_id, $user) {

            $this->db->join('items', 'items.id = sale_items.item_id', 'left');
            $this->db->select('
            sale_items.id,
            sale_items.qty,
            sale_items.discount,
            sale_items.srp,
            items.id as item_id,
            items.name,
            items.category,
            items.serial,
            items.unit
            ');          
            
            if (!is_null($user)) {
                $this->db->where('sale_items.user', $user);
            }
            $this->db->where('sale_items.sale_id', $sale_id); 

            $query = $this->db->get("sale_items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }



    /**
     * Adds an item to the actual inventory
     * @param [type] $item     [description]
     * @param [type] $qty      [description]
     * @param [type] $tag      [description]
     * @param [type] $tag_id   [description]
     * @param [type] $location [description]
     */
    function add_inventory($item, $qty, $tag, $tag_id, $location) {

            $data = array(              
                'item_id'    => $item,  
                'tag'        => $tag,  
                'tag_id'     => $tag_id,  
                'qty'        => $qty,  
                'location'   => $location       
             );
       
            return $this->db->insert('item_inventory', $data);    

    }



  

}