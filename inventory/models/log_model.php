<?php if (!defined('BASEPATH'))exit('No direct script access allowed');

Class Log_Model extends CI_Model {


     function log($action, $user, $icon) {


              $data = array(
             'user_id' => $user,
             'tag'    => 'user',
             'icon'   => $icon,
             'action' => $action,
             'ip_address' => $_SERVER['REMOTE_ADDR'],
          );

          $this->db->insert('logs', $data); 
             
        
    }

    function last_login($user) {

        $data = array(
               'last_login' => now()               
            );

    $this->db->where('id', $user);
    $this->db->update('users', $data); 
    }
    
}

