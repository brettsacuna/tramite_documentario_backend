<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Disposicion extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Disposicion_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Disposicion_model->get_disposiciones(), REST_Controller::HTTP_OK);
	    }

		public function index_post() {
			$this->response($this->Disposicion_model->save_disposicion_final($this->input->post()), REST_Controller::HTTP_OK);
		}
	}
