<?php
class Articulo extends Controllers
{
    public function __construct()
    {
        parent::__construct();
    }

    public function articulo()
    {
        $usuario = null;
        $usuario = isset($_SESSION["usuario"]);
        $autor = null;
        $autor = isset($_SESSION["autor"]);
        if (null != $usuario) {
            require VIEWS . DFT . "heads.html";
            $this->view->render($this, "articulo");
            require VIEWS . DFT . "footer.html";
        } else if (null != $autor) {
            require VIEWS . DFT . "heada.html";
            $this->view->render($this, "articulo");
            require VIEWS . DFT . "footer.html";
        } else {
            //redireccionamos el usuario a la vista login
            require VIEWS . DFT . "head.html";
            $this->view->render($this, "articulo");
            require VIEWS . DFT . "footer.html";
        }
    }

}
