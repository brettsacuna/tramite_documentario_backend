<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Seccion_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_secciones() {
            return $this->db->get('seccion')->result();
        }
    }
