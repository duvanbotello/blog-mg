<?php
class Registrar_model extends Conexion
{
    public function __construct()
    {
        //Ejecutamos el metodos Constructor de la clase Conexion.
        parent::__construct();
    }

    public function registrarusuario($nombre,$apellido,$fecha_nac,$imagen,$correo,$contrasena){
        
        $where = "usu_correo = :Correo";
        $param = array('Correo' => $correo);
        $response = $this->db->select("*",'usuario',$where,$param);
        
        if(is_array($response)){
            $response = $response['results'];
            //en esta coleccion de datos no hay ningun registro
            //por lo tanto no esta registrado
            //devuelve 0
         
            if(0 == count($response)){
                //creando clase anonimas
                //solo se utilizara una ves
                
                $attr = "(usu_nombre,usu_apellido,usu_fechanac,usu_imagen,usu_correo,usu_password)";
                $values = "(:Nombre,:Apellido,:Fechanac,:Imagen,:Correo,:Contrasena)";
                $password = password_hash($contrasena, PASSWORD_DEFAULT);
                $param = null;
                $param = array('Nombre' => $nombre,
                               'Apellido' => $apellido,
                               'Fechanac' => $fecha_nac,
                               'Imagen' => $imagen,
                               'Correo' => $correo,
                               'Contrasena' => $password,
                              );
                $respuestaInsert = $this->db->insert($attr,'usuario', $values, $param);
                return $respuestaInsert;
                
            }else{
                return 1;
            }
        }else{//envia error si se presento inconveniente en la consulta
            return $response;
        }
    }

    function cargar_imagen($tipo,$imagen,$email){
        //compruebo que lo que se esta cargando es una imagen
        if(strstr($tipo,"image")){
            $destino = "./Resource/fotos/".$email.".png";
            move_uploaded_file($imagen, $destino);
            return $email.".png";
;        }
    }
 
}