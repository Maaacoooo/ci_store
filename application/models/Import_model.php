<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Import_Model extends CI_Model {


    function create($export_id, $user) {

      //Update Export Status
      $export = array(                          
                'status'     => 3                   
             );

        $this->db->where('id', $export_id);
        $this->db->update('exports', $export); 

      //Create Import Data
        $data = array(                                       
                'export_id'   => $export_id,
                'status'      => 1,
                'user'        => $user             
             );
       
           return $this->db->insert('imports', $data);    
    }


    function update($id, $location) {
        //Update Export Data
        $export_id = $this->view($id)['export_id'];
        $export = array(                          
                'status'     => 4                   
             );

        $this->db->where('id', $export_id);
        $this->db->update('exports', $export); 

        //Update Import Data
          $data = array(                       
                'remarks'     => $this->input->post('remarks'),                      
                'location'     => $location,                      
                'status'      => 2,                      
             );

           $this->db->where('id', $id);
           return $this->db->update('imports', $data);              
    }



    function view($id) {
            $this->db->join('users', 'users.username = imports.user', 'left');
            $this->db->join('exports', 'exports.id = imports.export_id', 'left');            
            $this->db->select('
                imports.id,
                imports.remarks,
                imports.location,
                imports.status,
                imports.created_at,
                imports.updated_at,
                imports.export_id,
                users.name as user,
                users.username,
                exports.courier,
                exports.tracking_no,
                exports.remarks as export_remarks,
                exports.created_at as export_created_at,
                exports.updated_at as export_updated_at,
            ');
            $this->db->where('imports.id', $id);
            $query = $this->db->get('imports');

            return $query->row_array();
    }



    function fetch_imports($limit, $id, $search) {

            if($search) {
              $this->db->like('exports.brand', $search);
            }

            $this->db->join('users', 'users.username = imports.user', 'left');
            $this->db->join('exports', 'exports.id = imports.export_id', 'left');
            $this->db->select('
                imports.id,
                imports.status,
                imports.created_at,
                imports.updated_at,
                exports.id as export_id,
                users.name as user                
            ');
            
            $this->db->order_by('imports.created_at', 'DESC');
            $this->db->limit($limit, (($id-1)*$limit));

            $query = $this->db->get("imports");

            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;

    }

    /**
     * Returns the total number of rows of users
     * @return int       the total rows
     */
    function count_imports($search) {

        $this->db->join('exports', 'exports.id = imports.export_id', 'left');
        return $this->db->count_all_results("imports");
    }






    // IMPORT ITEMS ////////////////////////////////////////////////////////////////////////////


    /**
     * Adds an item to an import grp / cart
     * @param [type] $item      [description]
     * @param [type] $qty       [description]
     * @param [type] $export_id [description]
     */
    function add_item($item, $qty, $dp, $srp, $import_id) {

            $data = array(              
                'item_id'       => $item,  
                'import_id'     => $import_id,  
                'dealer_price'  => $dp,  
                'actual_price'  => $srp,  
                'import_id'     => $import_id,  
                'qty'           => $qty         
             );
       
            return $this->db->insert('import_items', $data);    

    }

    function update_item_qty($item, $qty, $dp, $srp, $import_id) {

            //if $qty > 0 - update row 
            if($qty) {
              
              $data = array(              
                'qty'           => $qty,                    
                'dealer_price'  => $dp,                    
                'actual_price'  => $srp                    
             );
            
              $this->db->where('item_id', $item);
              $this->db->where('import_id', $import_id);
              return $this->db->update('import_items', $data); 

            } else {
            
              $this->db->where('item_id', $item);
              $this->db->where('import_id', $import_id);
              return $this->db->delete('import_items'); 

            }     

    }

     function view_item($item, $import_id) {

            $this->db->select('*');        
            $this->db->where('item_id', $item);
            $this->db->where('import_id', $import_id);        
            $this->db->limit(1);

            $query = $this->db->get('import_items');

            return $query->row_array();
    }


    function fetch_import_items($import_id) {

            $this->db->join('items', 'items.id = import_items.item_id', 'left');
            $this->db->select('
            import_items.id,
            import_items.qty,
            import_items.actual_price,
            import_items.dealer_price,
            items.id as item_id,
            items.name,
            items.category,
            items.serial,
            items.unit
            ');          
           
            $this->db->where('import_items.import_id', $import_id); 

            $query = $this->db->get("import_items");

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