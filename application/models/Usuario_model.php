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

        public function get_usuarios() {
            $this->db->select("usuario.usuario_id, usuario.usuario, usuario.tipo_usuario, usuario.estado");
            return $this->db->get_where('usuario', array('usuario.tipo_usuario' => 1))->result();
        }

        public function new_usuario($usuario) {
            try {
                $this->db->trans_begin();

                $this->db->insert('usuario', $usuario);

                $usuario_insertado = $this->db->insert_id();

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'usuario' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'usuario' => $usuario_insertado);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'usuario' => null);
            }
        }

        public function delete_usuario($usuario) {
            try {
                $this->db->trans_begin();

                $this->db->delete('usuario', array('usuario_id' => $usuario));

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'usuario' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'usuario' => $usuario);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'usuario' => null);
            }
        }
    }
