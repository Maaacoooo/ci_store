<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*
 * 	SITE CONFIG
 *
 * 	This includes the necessary functions for global use.
 * 	
 */

	$this->load->model('setting_model');
	//GET SITE TITLE
	$data['site_title'] = $this->setting_model->sitename()['value'];

?>