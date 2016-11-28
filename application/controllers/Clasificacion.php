<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Clasificacion extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Clasificacion_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Clasificacion_model->get_clasificaciones(), REST_Controller::HTTP_OK);
	    }
	}
