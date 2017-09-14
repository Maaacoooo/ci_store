<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class Login_model extends CI_Model {

////////////////////////////////////////////////////////////////////
/// ADMIN
////////////////////////////////////////////////////////////////////

    function verify_admin($username, $password) {
        //PASSWORD HASHING
        $salt = 'r&r1d0%E160m<v|';
        $pepper = 'nXG)4sNT5m&<E+5';
        $hash_pass = md5($salt . $password . $pepper);

        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('username', $username);
        $this->db->where('password', $hash_pass);
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() == 1) {

            return $query->result();
        } else {

            return FALSE;
        }
    }

}
