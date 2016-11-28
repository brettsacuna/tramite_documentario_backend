<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Decreto_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function save_decreto($decreto) {
            try {
                $this->db->trans_begin();

                $decreto_insertado = null;

                if ($decreto['accion'] == 0) {
                    $this->db->insert('decreto', array_slice($decreto, 0, 4));
                    $decreto_insertado = $this->db->insert_id();

                    $this->db->update('documento', array('fecha_decreto' => date('Y-m-d H:i:s')), array('documento_id' => $decreto['documento_id']));
                } else {
                    if ($this->db->update('decreto', array_slice($decreto, 0, 4), array('decreto_id' => $decreto['decreto_id']))) {
                        $this->db->delete('decreto_disposicion', array('decreto_id' => $decreto['decreto_id']));
                        $this->db->delete('decreto_seccion', array('decreto_id' => $decreto['decreto_id']));
                    }
                }

                foreach ($decreto['secciones'] as $seccion) {
                    $seccion_datos = array(
                        'decreto_id' => ($decreto['accion'] == 0) ? $decreto_insertado : $decreto['decreto_id'],
                        'seccion_id' => $seccion['seccion_id'],
                        'estado' => 1
                    );

                    $this->db->insert('decreto_seccion', $seccion_datos);
                }

                foreach ($decreto['disposiciones'] as $seccion) {
                    $disposicion_datos = array(
                        'decreto_id' => ($decreto['accion'] == 0) ? $decreto_insertado : $decreto['decreto_id'],
                        'disposicion_id' => $seccion['disposicion_id'],
                        'estado' => 1
                    );

                    $this->db->insert('decreto_disposicion', $disposicion_datos);
                }

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'decreto' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'decreto' => $this->db->insert_id() || $decreto['decreto_id']);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'documento' => null);
            }
        }

        public function get_decreto($documento) {
            $this->db->select('decreto.*');

            $decreto = $this->db->get_where('decreto', array('documento_id' => $documento));

            if ($decreto->num_rows() == 0) {
                return [];
            } else {
                return array_merge((array)$decreto->result()[0], array('secciones' => $this->get_secciones_decreto($decreto->result()[0]->decreto_id), 'disposiciones' => $this->get_disposiciones_decreto($decreto->result()[0]->decreto_id)));
            }
        }

        private function get_secciones_decreto($decreto) {
            $this->db->select('seccion.*');
            $this->db->join('seccion', 'seccion.seccion_id = decreto_seccion.seccion_id');

            $secciones = $this->db->get_where('decreto_seccion', array('decreto_id' => $decreto));

            if ($secciones->num_rows() == 0) {
                return [];
            } else {
                return $secciones->result();
            }
        }

        private function get_disposiciones_decreto($decreto) {
            $this->db->select('disposicion.*');
            $this->db->join('disposicion', 'disposicion.disposicion_id = decreto_disposicion.disposicion_id');

            $disposiciones = $this->db->get_where('decreto_disposicion', array('decreto_id' => $decreto));

            if ($disposiciones->num_rows() == 0) {
                return [];
            } else {
                return $disposiciones->result();
            }
        }
    }
