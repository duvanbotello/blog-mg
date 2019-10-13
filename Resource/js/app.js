var login = new Login();
var registrar1 = new Registrar();

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

var sessionClose = () => {
  login.sessionCLose();
}



//<img src="../plantilla_principal/images/usuario.png" class="rounded mx-auto d-block" alt="...">
var cargarimagen = () => {
 
  document.getElementById("foto_perfil").innerHTML = ['<img class="rounded mx-auto d-block" alt="..." src="',
  PATHNAME+"plantilla_principal/images/usuario.png",'" alt="..."/>'].join('');
}

var archivo = (evt) =>{
  registrar1.archivo(evt);
}

var registrar = () => {
  
  var nombre = document.getElementById("c_nombre").value;
  var apellido = document.getElementById("c_apellido").value;
  var fecha_nac = document.getElementById("c_fecha").value;
  var correo = document.getElementById("c_correo").value;
  var contrasena1 = document.getElementById("c_contrasena1").value;
  var contrasena2 = document.getElementById("c_contrasena2").value;
  registrar1.registrar(nombre, apellido, correo,fecha_nac, contrasena1, contrasena2);

}

var alerta1 = () => {
  var p1 = document.getElementById("c_contrasena1").value;
  var p2 = document.getElementById("c_contrasena2").value;
  registrar1.verificandopasswrod(p1, p2);
}

//utilizando jquery
$().ready(() => {
  let URLactual = window.location.pathname;
  switch(URLactual){
    case PATHNAME + "Registrar/registrar_usuario":
      cargarimagen();
      document.getElementById('file-image').addEventListener('change',archivo, false);
      break;
  }

});