<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Users extends CI_Controller {

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
		$this->load->model('user_model');

	}	

	// USER LIST
	public function index()	{

		if($this->session->userdata('admin_logged_in'))	{
			//GROUP
			$data['group'] = 'Users';
			//PAGE TITLE
		    $data['title'] = 'User List';
	    	//GLOBAL CONFIG	
		    include 'site_config.php';
            //PAGINATE ITEMS                        
            $config['num_links'] = 5;
            $config['base_url'] = base_url('admin/userss/index/');
            $config["total_rows"] = $this->user_model->count_users();
            $config['per_page'] = 30;
            $this->load->config('pagination'); //LOAD PAGINATION CONFIG
            $this->pagination->initialize($config);
            if ($this->uri->segment(3)) {
                $page = ($this->uri->segment(3));
            } else {
                $page = 1;
            }
            $data["results"] = $this->user_model->fetch_users($config["per_page"], $page, 1);
            $str_links = $this->pagination->create_links();
            $data["links"] = explode('&nbsp;', $str_links);
            $data['page'] = $page;
            //END PAGINATION
                //LOAD VIEW             
                $this->load->view('admin/users/users', $data);
 
		} else {
 			//If no session, redirect to login page
			$this->session->set_flashdata('error', 'Oops! Please login to continue');
		    redirect('admin/admin_login', 'refresh');
		}

	}
	// USER CREATE
	public function create() {

		if($this->session->userdata('admin_logged_in')) {
			//GROUP
			$data['group'] = 'Users';
			//PAGE TITLE
			$data['title'] = 'Add User';
	    	//GLOBAL CONFIG	
		    include 'site_config.php';
		    //INCLUDE USERTYPE
            $data['types'] = $this->user_model->usertypes();
            //FORM VALIDATION
            $this->form_validation->set_rules('name', 'Name', 'trim|xss_clean');
            $this->form_validation->set_rules('username', 'Username', 'callback_username_check');
            $this->form_validation->set_rules('password', 'Password', 'trim|matches[conpassword]');
            $this->form_validation->set_rules('conpassword', 'Confirm Password', 'trim|xss_clean');
            $this->form_validation->set_rules('usertype', 'Usertype', 'trim|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/users/create', $data);
            } else {

                if ($this->user_model->create()) {
                    $this->session->set_flashdata('success', 'New User : <u>' . $this->input->post('username') . '</u> Saved!');

                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'An Error has Occured!');
                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
                }
            }
		} else {
 			//If no session, redirect to login page
			$this->session->set_flashdata('error', 'Oops! Please login to continue');
		    redirect('admin/admin_login', 'refresh');
		}

	}
	// USER UPDATE
    public function update($id) {

        if ($this->session->userdata('admin_logged_in')) {
			//GROUP
			$data['group'] = 'Users';
			//PAGE TITLE
			$data['title'] = 'Add User';
	    	//GLOBAL CONFIG	
		    include 'site_config.php';
		    //INCLUDE USERTYPE
            $data['types'] = $this->user_model->usertypes();
            //FETCH DATA
            $data['items'] = $this->user_model->view($id);
            //PAGE TITLE
            $data['title'] = 'Edit : <u>' .$this->user_model->view($id)['name'].'</u>' ;

            if (!$id OR ! $data['items']) {
                $this->session->set_flashdata('error', 'An Error has Occured! No result found!');
                redirect('users', 'refresh');
            }

            //FORM VALIDATION
            if($this->input->post('password')){
	            $this->form_validation->set_rules('oldpassword', 'Old Password', 'required|callback_password_check');
	            $this->form_validation->set_rules('password', 'New Password', 'required');
            }
	            $this->form_validation->set_rules('name', 'Name', 'trim|xss_clean');
	            $this->form_validation->set_rules('usertype', 'Usertype', 'trim|xss_clean');
	            $this->form_validation->set_rules('username', 'Username', 'trim|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/users/update', $data);
            } else {

                if ($this->user_model->update()) {
                    $this->session->set_flashdata('success', 'Saved');

                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'An Error has Occured!');
                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
                }
            }
        } else {
            //If no session, redirect to login page
            $this->session->set_flashdata('error', 'Oops! Please login to continue');
            redirect('admin/admin_login', 'refresh');
        }
    }
// USER DELETE
    public function delete() {
        if ($this->session->userdata('admin_logged_in')) {

            if ($this->input->post('id')) {

                if ($this->user_model->delete()) {
                    $this->session->set_flashdata('success', 'User Deleted');

                    redirect('admin/users/users', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'An Error has Occured!');
                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
                }
            } else {
                $this->session->set_flashdata('error', 'An Error has Occured!');
                redirect($_SERVER['HTTP_REFERER'], 'refresh');
            }
        } else {
            //If no session, redirect to login page
            $this->session->set_flashdata('error', 'Oops! Please login to continue');
            redirect('admin/admin_login', 'refresh');
        }
    }

    // USERNAME CHECK 
    public function username_check($str) {

        $result = $this->user_model->check_user($str);

        if ($result) {
            $this->form_validation->set_message('username_check', 'Username Already exist!');
            return false;
        } else {
            return true;
        }
    }
    // PASSWORD CHECK
    function password_check($str){

        $result = $this->user_model->check_password($str);

        if($result){            
            return true;
        }
        else {
            $this->form_validation->set_message('password_check', 'Old Password does not match!');
            return false;
        }
    }

}

?>