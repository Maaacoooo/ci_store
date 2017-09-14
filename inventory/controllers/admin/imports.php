<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Imports extends CI_Controller {

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

// READ DATA ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// ITEM LIST
	public function index()	{

		if($this->session->userdata('admin_logged_in'))	{
			//ITEM GROUP
			$data['group'] = 'Imports';
			//PAGE TITLE
		    $data['title'] = 'Import Item';
	    	//GLOBAL CONFIG
	    	include 'site_config.php';
            //Get the total of qty
            $data['qty'] = $this->item_model->total_qty();
            //PAGINATE ITEMS                        
            $config['num_links'] = 5;
            $config['base_url'] = base_url('admin/imports/index/');
            $config["total_rows"] = $this->item_model->count_inventory();
            $config['per_page'] = 30;
            $this->load->config('pagination'); //LOAD PAGINATION CONFIG
            $this->pagination->initialize($config);
            if ($this->uri->segment(3)) {
                $page = ($this->uri->segment(3));
            } else {
                $page = 1;
            }
            $data["results"] = $this->item_model->fetch_inventory($config["per_page"], $page, 1);
            $str_links = $this->pagination->create_links();
            $data["links"] = explode('&nbsp;', $str_links);
            $data['page'] = $page;
            //END PAGINATION
                //LOAD VIEW             
                $this->load->view('admin/items/imports/create', $data);
 
		} else {
 			//If no session, redirect to login page
			$this->session->set_flashdata('error', 'Oops! Please login to continue');
		    redirect('admin/admin_login', 'refresh');
		}

	}

    // READ IMPORTS ACTIVITY
    public function import_activity() {
            //ITEM GROUP
            $data['group'] = 'Imports';
            //PAGE TITLE
            $data['title'] = 'Import Item';
            //GLOBAL CONFIG
            include 'site_config.php';
        if($this->session->userdata('admin_logged_in')) {
            $this->load->view('admin/items/imports/imports', $data);
        } else {
            //If no session, redirect to login page
            $this->session->set_flashdata('error', 'Oops! Please login to continue');
            redirect('admin/admin_login', 'refresh');
        }
    }

// CREATE DATA ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // IMPORT DATA
    public function create() {

        if($this->session->userdata('admin_logged_in')) {         
            //GLOBAL CONFIG
            include 'site_config.php';
            //Get the total of qty
            $data['qty'] = $this->item_model->total_qty();

            //FORM VALIDATION
            $this->form_validation->set_rules('description', 'Name', 'trim|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/imports', $data);
            } else {

                if ($this->item_model->import_data()) {
                    $this->session->set_flashdata('success', 'New Import Items Saved!');

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

    // CREATE OBJECT RECORD
    public function create_object_record() {

            if ($this->session->userdata('admin_logged_in')) {
            //Get the total of qty
            $data['qty'] = $this->item_model->total_qty();

                $this->form_validation->set_rules('obj_id', 'Value', 'trim|xss_clean|required|callback_check_obj_id');
                $this->form_validation->set_rules('qty', 'Quantity', 'trim|xss_clean|required');

            if ($this->form_validation->run() == FALSE) {
                $this->session->set_flashdata('error', 'Error Occured! Please Check your Input');
                    redirect($_SERVER['HTTP_REFERER'], 'refresh');
            } else {
                if ($this->item_model->create_object_record()) {
                    $this->session->set_flashdata('success', 'Saved!');

                    //Log the user activity;
                    $activity = 'Created a Item' . $this->input->post('obj_id');
                    $this->setting_model->log_activity($activity);
                    //End Log

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

// UPDATE DATA ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
                redirect('admin/imports/imports', 'refresh');
            }

            $this->form_validation->set_rules('title', 'Name', 'trim|xss_clean');
            $this->form_validation->set_rules('unit', 'Unit', 'trim|xss_clean');
            $this->form_validation->set_rules('op', 'Original Price', 'trim|xss_clean');
            $this->form_validation->set_rules('sp', 'Selling Price', 'trim|xss_clean');
            $this->form_validation->set_rules('description', 'Description', 'trim|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $this->load->view('admin/items/imports/update', $data);
            } else {

                if ($this->item_model->update()) {
                    $this->session->set_flashdata('success', 'Item Updated :<u>'. $this->input->post('title').'</u> Saved!');

                    //Log the user activity;
                    $activity = 'Updated a Item' . $this->input->post('title');
                    $this->setting_model->log_activity($activity);
                    //End Log

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

// DELETE DATA ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // ITEM DELETE
    public function delete() {
        if ($this->session->userdata('admin_logged_in')) {

            if ($this->input->post('id')) {

                if ($this->item_model->delete()) {
                    $this->session->set_flashdata('success', 'Item Deleted');

                    redirect('admin/items/imports/delete', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'An Error has Occured!');
                    #redirect($_SERVER['HTTP_REFERER'], 'refresh');
                }
            } else {
                $this->session->set_flashdata('error', 'An Error has Occured!');
                #redirect($_SERVER['HTTP_REFERER'], 'refresh');
            }
        } else {
            //If no session, redirect to login page
            $this->session->set_flashdata('error', 'Oops! Please login to continue');
            redirect('admin/admin_login', 'refresh');
        }
    }

    // RESET ALL THE IMPORT ITEMS
    public function reset() {
        if($this->session->userdata('admin_logged_in')) {
            //SITE CONFIG
            include 'site_config.php';
            $type = "import";
            $user_id = $this->session->userdata('admin_logged_in')['id'];
            $this->item_model->reset($user_id, $type);
            $this->session->set_flashdata('success', 'Successfully Reseted!');
            redirect($_SERVER['HTTP_REFERER'], 'refresh');
        } else {
            //if no session, redirect to login page
            $this->session->set_flashdata('error', 'Oops! Please login to continue');
            redirect('admin/admin_login', 'refresh');
        }
    }

    // JSON GET OBJECTS 
    public function get_json_objects(){
         
            if (isset($_GET['term'])){

              $q = strtolower($_GET['term']);        
              $result = $this->item_model->get_json_objects($q); 

                if($result) {
                     foreach ($result as $row)       {

                        $new_row['text']    =   htmlentities(stripslashes($row['name'] . ' -- ' . $row['op']));
                        $new_row['id']      =   $row['id'];
                        $row_set[]          =   $new_row; //build an array
                  }

              echo json_encode($row_set); //format the array into json data
                 
            }

          }
    }


}

?>