<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	require APPPATH . '/libraries/REST_Controller.php';

	Class Documento extends REST_Controller {
		public function __construct() {
	        parent::__construct();
	        $this->load->model(array('Documento_model'));
	    }

	    public function index_get() {
			$limite = $this->input->get('limite');
            $pagina = $this->input->get('pagina');
            $desde = $this->input->get('desde');
            $hasta = $this->input->get('hasta');
            $numero_registro = $this->input->get('numero_registro');
            $unidad_origen = $this->input->get('unidad_origen');
            $tipo_documento = $this->input->get('tipo_documento');
            $destino = $this->input->get('destino');
            $bandera = $this->input->get('bandera');
            $estado = $this->input->get('estado');
            $tipo_usuario = $this->input->get('tipo_usuario');
            $usuario = $this->input->get('usuario');

	    	$this->response($this->Documento_model->get_documentos(($pagina == 1 ? 0 : (($pagina - 1) * $limite)), $limite, $desde, $hasta, $numero_registro, $unidad_origen, $tipo_documento, $destino, $bandera, $estado, $tipo_usuario, $usuario), REST_Controller::HTTP_OK);
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
				$documento_data = array_merge((array)$this->input->post('datos'), array('url_archivo' => $this->upload->data()['file_name'], 'estado' => 1, 'estado_documento' => 1));

				$this->response($this->Documento_model->save_documento($documento_data), REST_Controller::HTTP_OK);
			}
		}

		public function index_put() {
			$this->response($this->Documento_model->update_documento($this->put()), REST_Controller::HTTP_OK);
		}
	}
