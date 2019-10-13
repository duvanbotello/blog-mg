<?php
class Login extends Controllers
{
    public function __construct()
    {
        parent::__construct();
    }

    public function iniciarsession()
    {
        require VIEWS . DFT . "head.html";
        $this->view->render($this, "Login");
        require VIEWS . DFT . "footer.html";
    }

    public function destroySession()
    {
        //utilizamos el metodo destroy de la clase Sessiones
        Session::destroy();
        //y redirecciona a la URL principal, osea al index
        header("Location:" . URL);
    }
    
    public function userLogin()
    {
        if (isset($_POST["email"]) && isset($_POST["password"])) {
            //vamos a utilizar el metodo userLogin del modelo index_model
            //ya que esta clase extiende a Controllers y por consecuente se pueden
            //utilizar todas las clases dentro de Models
            //y utilizo la instancia model para el metodo UserLogin que esta dentro de index_model
            $data = $this->model->userLogin($_POST["email"], $_POST["password"]);
            //verificamos si es un array o contiene un array
            if (is_array($data)) {
                echo json_encode($data);
            } else {
                echo $data;
            }
        }
    }
    public function autorLogin()
    {
        if (isset($_POST["email"]) && isset($_POST["password"])) {
            $data = $this->model->autorLogin($_POST["email"], $_POST["password"]);
            if (is_array($data)) {
                echo json_encode($data);
            } else {
                echo $data;
            }
        }
    }
}
