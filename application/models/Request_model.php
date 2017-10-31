<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Request_Model extends CI_Model {


    function create($user, $brand) {

        $data = array(                                       
                'remarks'     => $this->input->post('remarks'),                
                'brand'       => $brand,
                'user'        => $user,
                'status'      => 1             
             );
       
         $this->db->insert('requests', $data);    
         return $this->db->insert_id();
    }


    function update($id) {
          $data = array(                                          
                'remarks'     => $this->input->post('remarks')                                           
             );

           $this->db->where('id', $id);
           return $this->db->update('requests', $data);              
    }


    function update_status($id, $status) {
          $data = array(                          
                'status'     => $status                   
             );

           $this->db->where('id', $id);
           return $this->db->update('requests', $data);              
    }


    function view($id) {
            $this->db->join('users', 'users.username = requests.user', 'left');
            $this->db->select('
                requests.id,
                requests.brand,
                requests.remarks,
                requests.status,
                requests.created_at,
                requests.updated_at,
                requests.brand,
                users.name as user,
                users.username
                
            ');
            $this->db->where('requests.id', $id);
            $query = $this->db->get('requests');

            return $query->row_array();
    }



    function fetch_requests($limit, $id, $search, $brand, $status) {

            if(!is_null($search)) {
              $this->db->group_start();
              $this->db->like('requests.id', $search);
              $this->db->or_like('requests.brand', $search);
              $this->db->group_end();
            }

            if(!is_null($brand)) {
              $this->db->where('requests.brand', $brand);
            }

            if(!is_null($status)) {
              $this->db->where('requests.status', $status);
            }  

            $this->db->join('users', 'users.username = requests.user', 'left');
            $this->db->select('
                requests.id,
                requests.remarks,
                requests.status,
                requests.created_at,
                requests.updated_at,
                requests.brand,
                users.name as user                
            ');
            
            $this->db->order_by('requests.created_at', 'DESC');
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("requests");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_requests($search, $brand, $status) {
        if(!is_null($search)) {
            $this->db->group_start();
            $this->db->like('requests.id', $search);
            $this->db->or_like('requests.brand', $search);
            $this->db->group_end();
        }

        if(!is_null($brand)) {
            $this->db->where('requests.brand', $brand);
        }

        if(!is_null($status)) {
            $this->db->where('requests.status', $status);
        }  

        return $this->db->count_all_results("requests");
    }






    // EXPORT ITEMS ////////////////////////////////////////////////////////////////////////////


    /**
     * Adds an item to an export grp / cart
     * @param [type] $item      [description]
     * @param [type] $qty       [description]
     * @param [type] $export_id [description]
     * @param [type] $user      [description]
     */
    function add_item($item, $qty, $dp, $request_id) {

            $data = array(              
                'item_id'     => $item,  
                'dp'          => $dp,
                'request_id'  => $request_id,  
                'qty'         => $qty           
             );
       
            return $this->db->insert('request_items', $data);    

    }

    function update_item_qty($item, $qty, $req_id) {

            //if $qty > 0 - update row 
            if($qty) {
              
              $data = array(              
                'qty'    => $qty                    
             );
            
              $this->db->where('item_id', $item);
              $this->db->where('request_id', $req_id);
              return $this->db->update('request_items', $data); 

            } else {
            
              $this->db->where('item_id', $item);
              $this->db->where('request_id', $req_id);
              return $this->db->delete('request_items'); 

            }     

    }

     function view_item($item, $request_id) {

            $this->db->select('*');        
            $this->db->where('item_id', $item);        
            $this->db->where('request_id', $request_id);        
            $this->db->limit(1);

            $query = $this->db->get('request_items');

            return $query->row_array();
    }


    function fetch_request_items($req_id) {

            $this->db->join('items', 'items.id = request_items.item_id', 'left');
            $this->db->select('
            request_items.id,
            request_items.qty,
            items.id as item_id,
            items.name,
            items.category,
            request_items.dp,
            items.serial,
            items.unit
            ');          
           
            $this->db->where('request_items.request_id', $req_id);

            $query = $this->db->get("request_items");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }



    /**
     * Generates an Export Queue and 
     * Copies the items and request details to Export
     * @param  [type] $req_id [description]
     * @param  [type] $user   [description]
     * @return [type]         [description]
     */
    function export($req_id, $user, $brand) {

        $data = array(              
                'user'        => $user,
                'brand'        => $brand,
                'status'      => 1             
             );
       
           $this->db->insert('exports', $data);    

           $export_id = $this->db->insert_id();

           $items = $this->fetch_request_items($req_id);

           if($items) {

            //get existing request items and copy to Export_Items table
            foreach ($items as $i) {
                    $data = array(              
                    'item_id'     => $i['item_id'],  
                    'dp'          => $i['dp'],  
                    'export_id'   => $export_id,  
                    'qty'         => $i['qty'],  
                    'user'        => $user               
                 );
       
                 $this->db->insert('export_items', $data);    
            }

           } else {
              return false;
           }


           return $export_id;
    }



  

}