<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Item_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////

    public function create() {

        $data = array(
            'name'           => ucwords($this->input->post('title')),
            'unit'           => $this->input->post('unit'),
            'op'             => $this->input->post('op'),
            'sp'             => $this->input->post('sp'),
            'description'    => $this->input->post('description')
        );

        return $this->db->insert('items', $data);
    }

    // Creating object records
    public function create_object_record() {
        $data = array(
            'user_id'            => $this->session->userdata('admin_logged_in')['id'],
            'item_id'            => $this->input->post('obj_id'),
            'qty'                => $this->input->post('qty'),
            'type'               => 'import'
        );

        return $this->db->insert('inventory_loc', $data);
    }

    // Importing data 
    public function import_data() {
        $data = array(
            'description'   => $this->input->post('description'),
            'user_id'       => $this->session->userdata('admin_logged_in')['id'],
            'total_amount'  => $this->input->post('total_amount'),
            'type'          => 'import'
        );

            $result = $this->db->insert('inventory_act', $data);
            $last_id = $this->db->insert_id();
            $this->import_inventory($last_id);

        return $result;
    }

    function import_inventory($last_id) {
        $this->db->select('
            inventory_loc.id,
            inventory_loc.user_id,
            inventory_loc.item_id,
            inventory_loc.qty,
            inventory_loc.type
        ');

        $this->db->where('user_id' ,$this->session->userdata('admin_logged_in')['id']);
        $this->db->where('type' ,'import');

        $query = $this->db->get('inventory_loc');

        if($query->num_rows() > 0) {
            $result = $query->result_array();
                foreach($result AS $row) {
                    $data = array(
                        'act_id'   => $last_id,
                        'item_id'  => $row['item_id'],
                        'quantity' => $row['qty']
                    );
                    $this->db->insert('inventory' ,$data);
                }
        }
    }


// UPDATE DATA ////////////////////////////////////////////////////////////////////

    public function update() {

        $data = array(
            'name'          => ucwords($this->input->post('title')),
            'unit'          => $this->input->post('unit'),
            'op'            => $this->input->post('op'),
            'sp'            => $this->input->post('sp'),
            'description'   => $this->input->post('description')
        );
        $this->db->where('id', $this->input->post('id'));
        return $this->db->update('items', $data);
    }

// DELETE DATA ////////////////////////////////////////////////////////////////////

    public function delete() {

        return $this->db->delete('items', array('id' => $this->input->post('id')));
    }

    // Reset all the import items
    public function reset($user_id, $type) {
            $this->db->from('inventory_loc');
            $this->db->where('user_id', $user_id ,'AND' ,'type', $type);
        return $this->db->delete('inventory_loc');
    }

// READ DATA //////////////////////////////////////////////////////////////////////

    // Count all ITEMS.
    public function count_items() {

        return $this->db->count_all("items");
    }
    // Fetch all ITEMS.
    public function fetch_items() {
        $this->db->select('items.id,
            items.name, 
            items.unit, 
            items.op,             
            items.sp,
            items.description,
            SUM(inventory.quantity) AS qty
            ');
        $this->db->join('inventory', 'inventory.item_id = items.id', 'left');
        $this->db->group_by('items.id');
        $query = $this->db->get("items");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    // View ALL Items.
    public function view($id) {

        $this->db->where('id', $id);
        $query = $this->db->get('items');
        return $query->row_array();
    }

    //JSON for Select2 Kind of damn
    function get_json_objects($q){
        $this->db->like('name', $q);
        $this->db->limit(15);
        $query = $this->db->get('items');
        if($query->num_rows > 0){
          return $query->result_array();
      }
    }

    // Count all INVENTORY.
    public function count_inventory() {

        return $this->db->count_all("inventory_loc");
    }
    // Fetch all INVENTORY
    public function fetch_inventory() {
        $this->db->select('inventory_loc.id,
            inventory_loc.user_id, 
            inventory_loc.item_id, 
            inventory_loc.qty,             
            items.id AS items_id,
            items.name AS items_name,
            items.unit AS items_unit,
            items.op AS items_op,
            items.sp AS items_sp,
            items.description AS items_description
            ');
        $this->db->order_by('items_name', 'ASC'); 
        $this->db->join('items', 'items.id = inventory_loc.item_id', 'left');
        $query = $this->db->get("inventory_loc");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    // Get the total qty in INVENTORY
    public function total_qty() {
        $this->db->where('inventory_loc.type', 'import');
        $this->db->where('inventory_loc.user_id', $this->session->userdata('admin_logged_in')['id']);
        $this->db->select_sum('qty');
        $this->db->from('inventory_loc');
        $query = $this->db->get();
        $total_sold = $query->row()->qty;

        if ($total_sold > 0) {
            return $total_sold;
        }
        return NULL;

    }


    //////////////
    // HELPERS

    function fetch_brands() {

            $this->db->select('*');
            $query = $this->db->get('item_brand');

            return $query->result_array();

    }
}