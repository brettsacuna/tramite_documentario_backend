<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Unidad_origen extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Unidad_origen_model'));
	    }

	    public function index_get() {
	    	$this->response($this->Unidad_origen_model->get_unidades_origen($this->input->get('filtro')), REST_Controller::HTTP_OK);
	    }
	}
