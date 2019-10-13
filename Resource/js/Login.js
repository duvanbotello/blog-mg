class Login {
    constructor() {

    }

    iniciarSesion(email, password,tipo_s) {

        //verifica que el campo email contenga datos.
        if (email == "") {
            //el .focus útil para posicionarnos en un campo concreto de un formulario, ya sea al principio del formulario
            //o por validaciones que vayamos haciendo y que nos hagan ir a otro campo del formulario.
            document.getElementById("email").focus();
            //toast para mandar mensajes
            toastr.error('Ingrese direccion de correo.');
        } else {
            //si el campo del email tieLone datos verifica el de la pasword
            if (password == "") {
                document.getElementById("password").focus();
                toastr.error('Ingrese Contraseña.');
            } else {
                //valida utilizan la funcion validarEmail que esta en Funciones
                //verificar si el email es valido
                if (validarEmail(email)) {

                    //para enviar nuestros datos por post al servidor
                    //le enviamos como parametro la ruta del controlador
                    //y optenemos respuesta atraves de response.
                    if (tipo_s == 1) {
                        
                        $.post(URL + "Login/userLogin", { email, password }, (response) => {
                            console.log(response)
                            try {
                                //paso los datos del vector response que envian desde el servidor
                                //con JSON para manejarlos en la vista.
                                var item = JSON.parse(response);
                                //Verifico que el idUsuario sea mayor a 0 para verificar que el inicio de
                                //session sea valido.
                                if (0 < item.idusuario) {
                                    localStorage.setItem("usuario", response);
                                    window.location.href = URL;
                                } else {
                                    //de lo contrario mostramos un mensaje de error
                                    toastr.error('Contraseña Incorrecta.');

                                }
                            } catch (response) {
                                //por si susece algun error en el proceimiento
                                toastr.error('Correo no registrado.');
                            }
                        });
                    } else {
                        $.post(URL + "Login/autorLogin", { email, password }, (response) => {
                            console.log(response)
                            try {
                                //paso los datos del vector response que envian desde el servidor
                                //con JSON para manejarlos en la vista.
                                var item = JSON.parse(response);
                                //Verifico que el idUsuario sea mayor a 0 para verificar que el inicio de
                                //session sea valido.
                                if (0 < item.idusuario) {
                                    localStorage.setItem("autor", response);
                                    window.location.href = URL;
                                } else {
                                    //de lo contrario mostramos un mensaje de error
                                    toastr.error('Contraseña Incorrecta.');

                                }
                            } catch (response) {
                                //por si susece algun error en el proceimiento
                                toastr.error('Correo no registrado.');
                            }
                        });
                    }


                } else {
                    document.getElementById("email").focus();
                    toastr.error('ingrese direccion de correo valida.');
                }
            }
        }
    }

    sessionCLose() {
        localStorage.removeItem("usuario");
    }
    sessionCLoseAsesor() {
        localStorage.removeItem("autor");
    }

}
