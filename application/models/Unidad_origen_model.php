<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Unidad_origen_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_unidades_origen($filtro) {
            $this->db->select('unidad.unidad_id, unidad.unidad');
            $this->db->like('unidad.unidad', $filtro);
            $this->db->limit(8);

            return $this->db->get('unidad')->result();
        }
    }
