<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Tipo_documento extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Tipo_documento_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Tipo_documento_model->get_tipos_documento(), REST_Controller::HTTP_OK);
	    }
	}
