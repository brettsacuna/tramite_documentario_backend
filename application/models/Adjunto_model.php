<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Adjunto_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function change_adjunto($documento, $adjunto) {
            try {
                $this->db->trans_begin();

                $this->db->update('documento', array('url_archivo' => $adjunto), array('documento_id' => $documento));

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'documento' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'documento' => $documento);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'documento' => null);
            }
        }
    }
