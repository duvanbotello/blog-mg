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
}
