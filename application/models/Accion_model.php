<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Accion_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_acciones() {
            return $this->db->get('accion')->result();
        }
    }
