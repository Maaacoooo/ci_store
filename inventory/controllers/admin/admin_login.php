<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_login extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()	{
		parent::__construct();		
		$this->load->model('login_model');
		$this->load->model('log_model');
	}	


	function index()	{
			$data['title'] = 'Admin Login';
			if($this->session->userdata('admin_logged_in')) {
				redirect('admin/dashboard', 'refresh');
			} else {
				//FORM VALIDATION
				$this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean|callback_check_database');
				if($this->form_validation->run() == FALSE) {
					$this->load->view('admin_login', $data);
				} else {
					redirect('admin/dashboard', 'refresh');
				}
			}		 
		 }
		 
	function check_database($username) {
		   //Field validation succeeded.  Validate against database
		   $password = $this->input->post('password');
		   //query the database
		   $result = $this->login_model->verify_admin($username, $password);
		 
		   if($result) {
		     $sess_array = array();
		     foreach($result as $row) {
		       $sess_array = array(
		         'id' => $row->id,
		         'username' => $row->username
		       );
		       $this->session->set_userdata('admin_logged_in', $sess_array);
		     }
		     //START LOG DATA
			    $activity = 'User Logged In';
			    $this->setting_model->log_activity($activity);
		     //END LOG DATA
		     return TRUE;
		   }
		   else {
		     $this->form_validation->set_message('check_database', 'Invalid username or password');
		     return false;
		   }
 		}


}
