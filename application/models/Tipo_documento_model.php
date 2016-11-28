<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Tipo_documento_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_tipos_documento() {
            return $this->db->get('tipo_documento')->result();
        }
    }
