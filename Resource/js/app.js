var cliente = new Cliente();

//creamos una funcion para optener los datos y enviarlos al servidor.
var iniciarSesion = () => {
  //optenemos los datos del formulario login.
  //se traen los input del formulario con id "email" y "pasword"
  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;
  //utilizamos el metodo loginuser de la clase usuario y le pasos el email y el password
  cliente.iniciarSesion(email, password);
}

var sessionClose = () => {
  cliente.sessionCLose();
}


var alerta1 = () => {
  var p1 = document.getElementById("c_contrasena1").value;
  var p2 = document.getElementById("c_contrasena2").value;
  registrar2.verificandopasswrod(p1, p2);
}

var sololetras = () => {
  var p1 = document.getElementById("c_contrasena1").value;
  var p2 = document.getElementById("c_contrasena2").value;
  registrar2.verificandopasswrod(p1, p2);
}




//utilizando jquery
$().ready(() => {
  //capturamos los datos que estamos pasando por la URL del navegador
  let URLactual = window.location.pathname;
  let URLactual2 = window.location;
  //llamamos a metodo userData de Usuarios.js
  cliente.userData(URLactual);
  cliente.userData3(URLactual);
  cliente.userData4(URLactual);
  //cargando SELECT HTML
  if (URLactual2 == URL + "Registrar/registrar") {
    registrar2.getRoles();
  }
  if (URLactual2 == URL + "Principal/principalAdmin") {
    gadmin.getTipoHabitacion();
  }

});