<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    Class Documento_model extends CI_Model{
        public function __construct() {
            parent::__construct();
        }

        public function get_documentos($pagina, $limite, $desde, $hasta, $numero_registro, $unidad_origen, $tipo_documento, $destino, $bandera, $estado, $tipo_usuario, $usuario) {

            if ($tipo_usuario == 0) {
                if ($bandera == 0) {
                    $this->db->like('documento.documento_id', $numero_registro);
                } else if ($bandera == 1) {
                    $this->db->where('documento.unidad_id_origen', $unidad_origen);
                } else if ($bandera == 2) {
                    $this->db->where('documento.tipo_documento_id', $tipo_documento);
                } else if ($bandera == 3) {
                    $this->db->where(array('documento.documento_fecha >= ' => $desde, "documento.documento_fecha <= " => $hasta));
                } else {
                    if ($estado == 2) {
                        $this->db->where(array('documento.seccion_id_destino' => $destino, 'documento.estado_documento' => 1));
                    }
                }
            } else {
                if ($bandera == 0) {
                    $this->db->like('documento.documento_id', $numero_registro);
                    $this->db->where('documento.usuario_id', $usuario);
                } else if ($bandera == 1) {
                    $this->db->where(array('documento.unidad_id_origen' => $unidad_origen, 'documento.usuario_id' => $usuario));
                } else if ($bandera == 2) {
                    $this->db->where(array('documento.tipo_documento_id' => $tipo_documento, 'documento.usuario_id' => $usuario));
                } else if ($bandera == 3) {
                    $this->db->where(array('documento.documento_fecha >= ' => $desde, "documento.documento_fecha <= " => $hasta, 'documento.usuario_id' => $usuario));
                } else {
                    if ($estado == 2) {
                        $this->db->where(array('documento.seccion_id_destino' => $destino, 'documento.estado_documento' => 1, 'documento.usuario_id' => $usuario));
                    }
                }
            }

            $total = $this->db->count_all_results('documento');

            $this->db->select('documento.*, seccion.seccion, clasificacion.clasificacion, tipo_documento.tipo_documento, unidad.unidad');
            $this->db->join('seccion', 'seccion.seccion_id = documento.seccion_id_destino');
            $this->db->join('clasificacion', 'clasificacion.clasificacion_id = documento.clasificacion_id');
            $this->db->join('tipo_documento', 'tipo_documento.tipo_documento_id = documento.tipo_documento_id');
            $this->db->join('unidad', 'unidad.unidad_id = documento.unidad_id_origen');

            if ($tipo_usuario == 0) {
                if ($bandera == 0) {
                    $this->db->like('documento.documento_id', $numero_registro);
                } else if ($bandera == 1) {
                    $this->db->where('documento.unidad_id_origen', $unidad_origen);
                } else if ($bandera == 2) {
                    $this->db->where('documento.tipo_documento_id', $tipo_documento);
                } else if ($bandera == 3) {
                    $this->db->where(array('documento.documento_fecha >= ' => $desde, "documento.documento_fecha <= " => $hasta));
                } else {
                    if ($estado == 2) {
                        $this->db->where(array('documento.seccion_id_destino' => $destino, 'documento.estado_documento' => 1));
                    }
                }
            } else {
                if ($bandera == 0) {
                    $this->db->like('documento.documento_id', $numero_registro);
                    $this->db->where('documento.usuario_id', $usuario);
                } else if ($bandera == 1) {
                    $this->db->where(array('documento.unidad_id_origen' => $unidad_origen, 'documento.usuario_id' => $usuario));
                } else if ($bandera == 2) {
                    $this->db->where(array('documento.tipo_documento_id' => $tipo_documento, 'documento.usuario_id' => $usuario));
                } else if ($bandera == 3) {
                    $this->db->where(array('documento.documento_fecha >= ' => $desde, "documento.documento_fecha <= " => $hasta, 'documento.usuario_id' => $usuario));
                } else {
                    if ($estado == 2) {
                        $this->db->where(array('documento.seccion_id_destino' => $destino, 'documento.estado_documento' => 1, 'documento.usuario_id' => $usuario));
                    }
                }
            }

            $this->db->limit($limite, $pagina);
            $documentos = $this->db->get('documento')->result();

            $resp = array('total' => $total, 'data' => $documentos);

            return $resp;
        }

        public function save_documento($documento) {
            try {
                $this->db->trans_begin();

                $this->db->insert('documento', $documento);

                $documento_insertado = $this->db->insert_id();

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'documento' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'documento' => array('documento_id' => $documento_insertado, 'adjunto' => $documento['url_archivo']));
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'documento' => null);
            }
        }

        public function update_documento($documento) {
            try {
                $this->db->trans_begin();

                $this->db->update('documento', array_slice($documento, 0, 7), array('documento_id' => $documento['documento_id']));

                if ($this->db->trans_status() === false){
                    $this->db->trans_rollback();

                    return array('estado' => 0, 'documento' => null);
                } else {
                    $this->db->trans_commit();

                    return array('estado' => 1, 'documento' => $documento['documento_id']);
                }
            } catch (Exception $e) {
                return array('estado' => 0, 'documento' => null);
            }
        }
    }
