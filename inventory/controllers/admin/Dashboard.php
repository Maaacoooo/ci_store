<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Dashboard extends CI_Controller {

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
	public function __construct()
	{
		parent::__construct();	

	}	


	public function index()	{

		if($this->session->userdata('admin_logged_in'))	{
			//PAGE TITLE
		    $data['title'] = 'Dashboard';
	    	//GET SITE TITLE		    	                  
	        $data['site_title'] = $this->setting_model->sitename()['value'];	

			$this->load->view('admin/dashboard/dashboard', $data); 
		} else {
 			//If no session, redirect to login page
			$this->session->set_flashdata('error', 'Oops! Please login to continue');
		    redirect('admin/admin_login', 'refresh');
		}

	}



}

?>