<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Copyright (c)2016, Jenmar "Maco" Cortes
 * Copyright TechDepot PH
 * All Rights Reserved
 * 
 * This license is a legal agreement between you and the Maco Cortes
 * for the use of Inventory System referred to as the "Software"
 * By obtaining the Software you agree to comply with the terms and conditions of this license.
 *
 * PERMITTED USE
 * You are permitted to use the program for educational purposes only.
 * 
 * MODIFICATION AND REDISTRIBUTION 
 * Unless with written approval obtained from Maco Cortes, 
 * You are NOT allowed to modify, copy, redistribute, and sell the Software.
 *
 * For any concerns, you may reach Maco Cortes via:
 * maco.techdepot@gmail.com
 * facebook.com/Maaacoooo
 * maco@techdepot-ph.com
 * TechDepot-PH.com
 */
class Setting_Model extends CI_Model {
      function __construct() {
        parent::__construct();
    }
    //  Returns USER DETAILS
      public function user($id) {

        $this->db->select('
                users.username,
                users.fullname,
                users.id,
                users.img,
                usertype.title AS usertype, 
                usertype.id AS type_id   
            ');
        $this->db->from('users');
        $this->db->where('users.id', $id);
        $this->db->join('usertype', 'usertype.id = users.usertype', 'left');
        $query = $this->db->get();

    }


    public function sitename() {

            $this->db->where('id', 1);
            $query = $this->db-> get('settings');
            return $query->row_array();

    }
    
    function log_activity($activity) {

        $data = array(
            'user_id'       =>  $this->session->userdata('admin_logged_in')['id'],
            'ip_address'    =>  $_SERVER['REMOTE_ADDR'],
            'activity'      =>  $activity,
            'user_agent'    =>  $_SERVER['HTTP_USER_AGENT']
        );

        return $this->db->insert('activity_logs', $data);

    }



   
}

?>