var login = new Login();

//creamos una funcion para optener los datos y enviarlos al servidor.
var iniciarSesion = () => {
  //optenemos los datos del formulario login.
  //se traen los input del formulario con id "email" y "pasword"
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let tipo_s = document.getElementById("tipo_usu").value;
  //utilizamos el metodo loginuser de la clase usuario y le pasos el email y el password
  login.iniciarSesion(email, password,tipo_s);
}

//utilizando jquery
$().ready(() => {


});