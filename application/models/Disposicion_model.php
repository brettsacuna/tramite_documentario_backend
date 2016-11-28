<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Disposicion_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_disposiciones() {
            return $this->db->get('disposicion')->result();
        }

        public function save_disposicion_final($disposicion) {
            try {
                $this->db->trans_begin();

                $this->db->update('documento', array('fecha_disposicion' => date('Y-m-d H:i:s'), 'disposicion_final' => $disposicion['observacion'], 'tipo_documento_id_disposicion_final' => $disposicion['tipo_documento'], 'estado_documento' => 2), array('documento_id' => $disposicion['documento_id']));

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'documento' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'documento' => $disposicion['documento_id']);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'documento' => null);
            }
        }
    }
