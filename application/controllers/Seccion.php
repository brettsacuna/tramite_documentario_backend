<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Seccion extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Seccion_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Seccion_model->get_secciones(), REST_Controller::HTTP_OK);
	    }
	}
