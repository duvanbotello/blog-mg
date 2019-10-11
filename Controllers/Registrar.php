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
}
