<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Settings_model extends CI_Model
{


    /**
     * This fetches the row data from the Settings table as requested
     * @param  String        $id     The Unique Key or ID
     * @return String Array          The array of row
     */
    function setting($id) {

             $this->db->select('*');        
             $this->db->where('key', $id);          

             $query = $this->db->get('settings');

             return $query->row_array();

    }

    /**
     * This fetches all the results from the Settings table as requested
     * @param  String        $grp    The settings_grp 
     * @return String Array          The array of results
     */
    function fetch_settings($grp) {

             $this->db->select('*');        
             $this->db->where('setting_grp', $grp);          

             $query = $this->db->get('settings');

             return $query->result_array();
    }

    /**
     * The General Setting Updater
     * This is also used in pages
     * @param  String       $key    The key or the row ID
     * @param  String       $title 
     * @param  String       $value 
     * @return Boolean              returns TRUE if success
     */
    function update_setting($key, $title, $value) {

            $data = array(             
                'title'     => $title,  
                'value'     => $value        
             );
            
            $this->db->where('key', $key);
            return $this->db->update('settings', $data);     
    }



    function fetch_manual() {
            $this->db->select('*');        
            $this->db->order_by('ord');
            $query = $this->db->get('manual');

            return $query->result_array();
    }


    function view_manual($id) {
            $this->db->select('*');        
            $this->db->where('id', $id);
            $query = $this->db->get('manual');
            return $query->row_array();
    }


    function create_manual($id) {

            $data = array(             
                'id'           => $id,  
                'title'        => $this->input->post('title'),  
                'category'     => $this->input->post('category'),  
                'description'  => $this->input->post('description'),       
             );
            
            return $this->db->insert('manual', $data);     
    }


    function update_manual($id) {

            $data = array(             
                'title'        => $this->input->post('title'),  
                'category'     => $this->input->post('category'),  
                'description'  => $this->input->post('description'),       
             );
            $this->db->where('id', $id);
            return $this->db->update('manual', $data);     
    }



     

}