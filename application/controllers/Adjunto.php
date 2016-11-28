<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Adjunto extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Adjunto_model'));
	    }

	    public function index_post() {
			$filename = md5(date('YmdHis'));

			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|pdf|doc|docx|xls|xlsx|ppt|pptx';
			$config['file_name'] = $filename;
			$config['max_size'] = 2048;

			$this->load->library('upload', $config);

			if (!$this->upload->do_upload('file')) {
				$this->response(array('estado' => 0), REST_Controller::HTTP_OK);
			} else {
				$this->response($this->Adjunto_model->change_adjunto($this->input->post('documento'), $this->upload->data()['file_name']), REST_Controller::HTTP_OK);
			}
	    }
	}
