<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Usuario extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Usuario_model'));
	    }

		public function index_get() {
			$this->response($this->Usuario_model->get_usuarios(), REST_Controller::HTTP_OK);
		}

	    public function index_post() {
	    	$this->response($this->Usuario_model->check_login($this->input->post()), REST_Controller::HTTP_OK);
	    }

		public function nuevo_post() {
			$this->response($this->Usuario_model->new_usuario($this->input->post()), REST_Controller::HTTP_OK);
		}

		public function index_delete() {
			$this->response($this->Usuario_model->delete_usuario($this->input->get('usuario')), REST_Controller::HTTP_OK);
		}
	}
