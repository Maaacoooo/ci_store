<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class User_Model extends CI_Model {

// CREATE DATA ////////////////////////////////////////////////////////////////////

    public function create() {

        //PASSWORD HASHING
        $salt = 'r&r1d0%E160m<v|';
        $pepper = 'nXG)4sNT5m&<E+5';
        $hash_pass = md5($salt . $this->input->post('password') . $pepper);

        //IMAGE HASHING
        $file_name = '';

        if ($_FILES['image']['name'] != NULL) {

            $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['encrypt_name'] = TRUE;

            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            $field_name = "image";
            $this->upload->do_upload($field_name);
            $data2 = array('upload_data' => $this->upload->data());
            foreach ($data2 as $key => $value) {
                $file_name = $value['file_name'];
            }
        }

        $data = array(
            'name' => ucwords($this->input->post('name')),
            'username' => $this->input->post('username'),
            'password' => $hash_pass,
            'type_id' => $this->input->post('usertype'),
            'img' => $file_name
        );

        return $this->db->insert('users', $data);
    }
// UPDATE DATA ////////////////////////////////////////////////////////////////////

    public function update() {

        //PASSWORD HASHING
        $salt = 'r&r1d0%E160m<v|';
        $pepper = 'nXG)4sNT5m&<E+5';
        $hash_pass = md5($salt . $this->input->post('password') . $pepper);

        //IMAGE HASHING
        $file_name = $this->input->post('img');

        if ($_FILES['image']['name'] != NULL) {

            $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['encrypt_name'] = TRUE;

            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            $field_name = "image";
            $this->upload->do_upload($field_name);
            $data2 = array('upload_data' => $this->upload->data());
            foreach ($data2 as $key => $value) {
                $file_name = $value['file_name'];
            }
        }

        if($this->input->post('password')) {
            $data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'img'      => $file_name,
                'password' => $hash_pass
            );
        } elseif($this->input->post('usertype')){
            $data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'img'      => $file_name,
                'type_id' => $this->input->post('usertype')
                );
        } else {

            $data = array(
                'name' => $this->input->post('name'),
                'username' => $this->input->post('username'),
                'img'      => $file_name
            );
        }

        $this->db->where('id', $this->input->post('id'));
        return $this->db->update('users', $data);
    }

// DELETE DATA ////////////////////////////////////////////////////////////////////

    public function delete() {

        //deletes the actual file in the ./uploads
        $this->db->where('id', $this->input->post('id'));
        $query = $this->db->get('users');
        foreach ($query->result_array() as $img) {
            if (!empty($img['img'])) {
                unlink('./uploads/' . $img['img']);
            }
            else { 
                unlink('./uploads/'); 
            }
        }
        return $this->db->delete('users', array('id' => $this->input->post('id')));
    }

// READ DATA //////////////////////////////////////////////////////////////////////

    // Count all ITEMS.
    public function count_users() {

        return $this->db->count_all("users");
    }

    public function fetch_users() {
        $this->db->select('users.id,
            users.name, 
            users.username, 
            users.password,             
            users.type_id,
            users.last_login,
            users.img,
            usertype.title as typetitle
            ');
        $this->db->order_by('users.name', 'ASC');
        $this->db->join('usertype', 'usertype.id = users.type_id', 'left');     
        $query = $this->db->get("users");
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function view($id) {

        $this->db->where('id', $id);
        $query = $this->db->get('users');
        return $query->row_array();
    }

    public function usertypes() {

        $query = $this->db->get('usertype');
        return $query->result_array();
    }

// CHECK USERNAME ///////////////////////////////////////////////////////////////
    
    public function check_user($str) {

        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('username', $str);
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() == 1) {

            return true;
        } else {

            return false;
        }
    }
// CHECK PASSWORD //////////////////////////////////////////////////////////////////////////////////
 
    function check_password($str){

        //PASSWORD HASHING
             $salt      = 'r&r1d0%E160m<v|';
             $pepper    = 'nXG)4sNT5m&<E+5';
             $hash_pass = md5($salt.$str.$pepper);

        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('id', $this->input->post('id'));
        $this->db->where('password', $hash_pass);
        $this->db->limit(1);

        $query = $this->db-> get();

        if($query->num_rows()==1) {

             return true;
        }
        else {

             return false;
        }
    }

}