<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Accion extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Accion_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Accion_model->get_acciones(), REST_Controller::HTTP_OK);
	    }
	}
