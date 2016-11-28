<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Clasificacion_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_clasificaciones() {
            return $this->db->get('clasificacion')->result();
        }
    }
