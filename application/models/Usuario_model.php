<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Usuario_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function check_login($usuario) {
            $this->db->select("usuario.usuario_id, usuario.usuario, usuario.tipo_usuario");
            $this->db->where(array("usuario.usuario" => $usuario["usuario"], "usuario.contrasena" => $usuario["contrasena"]));

            $flag = $this->db->get('usuario');

            if ($flag->num_rows() > 0) {
                return array("estado" => 1, "usuario" => $flag->result());
            } else {
                return array("estado" => 0, "usuario" => null);
            }
        }
    }
