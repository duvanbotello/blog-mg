<?php
class Index extends Controllers
{
    public function __construct()
    {
        parent::__construct();
    }
    public function destroySession()
    {
        //utilizamos el metodo destroy de la clase Sessiones
        Session::destroy();
        //y redirecciona a la URL principal, osea al index
        header("Location:" . URL);
    }
    public function index()
    {
        $usuario = null;
        $usuario = isset($_SESSION["usuario"]);
        $autor = null;
        $autor = isset($_SESSION["autor"]);
        if (null != $usuario) {
            require VIEWS . DFT . "heads.html";
            $this->view->render($this, "indexs");
            require VIEWS . DFT . "footer.html";
        } else if (null != $autor) {
            require VIEWS . DFT . "head.html";
            $this->view->render($this, "PrincipalAsesor");
            require VIEWS . DFT . "footer.html";
        } else {
            //redireccionamos el usuario a la vista login
            require VIEWS . DFT . "head.html";
            $this->view->render($this, "index");
            require VIEWS . DFT . "footer.html";
        }
    } 
}