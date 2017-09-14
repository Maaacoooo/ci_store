<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Items extends CI_Controller {

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
		$this->load->model('item_model');
	}	

	// ITEM LIST
	public function index()	{

		if($this->session->userdata('admin_logged_in'))	{
			//ITEM GROUP
			$data['group'] = 'Items';
			//PAGE TITLE
		    $data['title'] = 'User List';
	    	//GLOBAL CONFIG
	    	include 'site_config.php';

            //PAGINATE ITEMS                        
            $config['num_links'] = 5;
            $config['base_url'] = base_url('admin/items/index/');
            $config["total_rows"] = $this->item_model->count_items();
            $config['per_page'] = 30;
            $this->load->config('pagination'); //LOAD PAGINATION CONFIG
            $this->pagination->initialize($config);
            if ($this->uri->segment(3)) {
                $page = ($this->uri->segment(3));
            } else {
                $page = 1;
            }
            $data["results"] = $this->item_model->fetch_items($config["per_page"], $page, 1);
            $str_links = $this->pagination->create_links();
            $data["links"] = explode('&nbsp;', $str_links);
            $data['page'] = $page;
            //END PAGINATION
                //LOAD VIEW             
                $this->load->view('admin/items/items.php', $data);
 
		} else {
 			//If no session, redirect to login page
			$this->session->set_flashdata('error', 'Oops! Please login to continue');
		    redirect('admin/admin_login', 'refresh');
		}

	}
	// ITEM CREATE
	public function create() {

		if($this->session->userdata('admin_logged_in')) {
			//ITEM GROUP
			$data['group'] = 'Items';
			//PAGE TITLE
			$data['title'] = 'Add Item';
			//GLOBAL CONFIG
			include 'site_config.php';
            //FORM VALIDATION
            $this->form_validation->set_rules('name', 'Name', 'trim|xss_clean');
            $this->form_validation->set_rules('unit', 'Unit', 'trim|xss_clean');
            $this->form_validation->set_rules('op', 'Original Price', 'trim|xss_clean');
            $this->form_validation->set_rules('sp', 'Selling Price', 'trim|xss_clean');
            $this->form_validation->set_rules('description', 'Description', 'trim|xss_clean');


            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/items/create', $data);
            } else {

                if ($this->item_model->create()) {
                    $this->session->set_flashdata('success', 'New Item : <u>' . $this->input->post('title') . '</u> Saved!');

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
	// ITEM UPDATE
    public function update($id) {

        if ($this->session->userdata('admin_logged_in')) {

            //GLOBAL CONFIG
            include 'site_config.php';
            //GROUP
            $data['group'] = 'Items';
            //FETCH DATA
            $data['items'] = $this->item_model->view($id);
            //PAGE TITLE
            $data['title'] = 'Edit : <u>' .$this->item_model->view($id)['name'].'</u>' ;

            if (!$id OR ! $data['items']) {
                $this->session->set_flashdata('error', 'An Error has Occured! No result found!');
                redirect('admin/items/items', 'refresh');
            }

            $this->form_validation->set_rules('name', 'Name', 'trim|xss_clean');
            $this->form_validation->set_rules('Unit', 'Unit', 'trim|xss_clean');
            $this->form_validation->set_rules('op', 'Original Price', 'trim|xss_clean');
            $this->form_validation->set_rules('sp', 'Selling Price', 'trim|xss_clean');
            $this->form_validation->set_rules('description', 'Description', 'trim|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/items/update', $data);
            } else {

                if ($this->item_model->update()) {
                    $this->session->set_flashdata('success', 'Item Updated :<u>'. $this->input->post('title').'</u> Saved!');

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
    // ITEM DELETE
    public function delete() {
        if ($this->session->userdata('admin_logged_in')) {

            if ($this->input->post('id')) {

                if ($this->item_model->delete()) {
                    $this->session->set_flashdata('success', 'Item Deleted');

                    redirect('admin/items/items', 'refresh');
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


}

?>