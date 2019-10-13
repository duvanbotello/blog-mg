<?php
class Registrar extends Controllers
{
    public function __construct()
    {
        parent::__construct();
    }

    public function registrar_usuario()
    {
        require VIEWS . DFT . "head.html";
        $this->view->render($this, "registrar");
        require VIEWS . DFT . "footer.html";
    }

    public function registrarusuario(){
        $data = $this ->model->registrarusuario($_POST["nombre"],$_POST["apellido"],$_POST["fecha_nac"],$_POST["imagen"],$_POST["correo"],$_POST["contrasena"]);

        if($data == 1){
            echo 1;
        }else if($data == 2){
            echo 2;
        }else{
            echo $data;
        }
    }


}
