<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Decreto extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Decreto_model'));
	    }

	    public function index_post() {
	    	$this->response($this->Decreto_model->save_decreto($this->input->post()), REST_Controller::HTTP_OK);
	    }

		public function index_get() {
			$this->response($this->Decreto_model->get_decreto($this->input->get('documento')), REST_Controller::HTTP_OK);
		}
	}
