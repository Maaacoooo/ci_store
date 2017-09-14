<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin_logout extends CI_Controller {

    public function index() {
        
        $this->session->set_flashdata('success', 'You sucessfully logged out!');
        $this->session->unset_userdata('admin_logged_in');

        redirect('admin/admin_login', 'refresh');
    }

}
