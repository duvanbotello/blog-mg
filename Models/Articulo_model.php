<?php
class Articulo_model extends Conexion
{
    public function __construct()
    {
        //Ejecutamos el metodos Constructor de la clase Conexion.
        parent::__construct();
    }

    function getarticulos(){
        return $response = $this->db->getArticulos();
    }
    function getarticulo($id){
    
        return $response = $this->db->getArticulos2($id);
    }
   
}