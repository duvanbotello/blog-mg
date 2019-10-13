class Registrar {
    _construct() {

    }
//dasdas
    registrar(nombre, apellido, correo,fecha_nac, contrasena1, contrasena2) { 

        if (nombre == '') {
            toastr.error('Ingrese Nombres.');
            document.getElementById("c_nombre").focus();
        } else {
            if (apellido == '') {
                toastr.error('Ingrese Apellidos.');
                document.getElementById("c_apellido").focus();
            } else {
                if (validarEmail(correo)) {
                    if (contrasena1 == '') {
                        toastr.error('Ingresar Contraseña 1.');
                        document.getElementById("c_contrasena1").focus();
                    } else {
                        if (contrasena2 == '') {
                            toastr.error('Ingresar Contraseña 2.');
                            document.getElementById("c_contrasena2").focus();
                        } else {
                            if(fecha_nac==''){
                                toastr.error('Ingresar Fecha Nacimiento');
                                document.getElementById("c_fecha").focus();
                            }else{
                                if (this.verificandopasswrod2(contrasena1, contrasena2)) {
                                    //creamos una coleccion de objetos para enviarlos al servidor 
                                    var data = new FormData();
                                    $.each($('input[type=file]')[0].files, (i,file) =>{
                                        data.append('file',file)
                                    });
                                    data.append('nombre', nombre);
                                    data.append('apellido', apellido);
                                    data.append('fecha_nac',fecha_nac);
                                    data.append('correo', correo);
                                    data.append('contrasena', contrasena1);
    
                                    $.ajax({
                                        url: URL + "Registrar/registrarusuario",
                                        data: data,
                                        cache: false,
                                        contentType: false,
                                        processData: false,
                                        type: 'POST',
                                        success: (response) => {
                                            console.log(response);
                                            if (response == 1) {
                                                toastr.error('EL email ya esta registrado...');
                                                document.getElementById("c_correo").focus();
                                            } else if (response == 2) {
                                                toastr.success('Su registro se a completado con Exito..', 'Bienvenido', { timeOut: 5000 });
                                                document.getElementById("formularioRegistro").reset();
    
                                            }
                                        }
                                    });
    
                                } else {
                                    toastr.error('Las contraseñas deben Coincidir.');
                                    document.getElementById("c_contrasena1").focus();
                                }
                            }
                        }
                    }
                } else {
                    toastr.error('Correo No Valido.');
                    document.getElementById("c_correo").focus();
                }
            }
        }


    }

    //para cargar la imagen
    archivo(evt){
        let files = evt.target.files;
        let f = files[0];
        if(f.type.match('image.*')){
            let reader = new FileReader();
            reader.onload = ((theFile) =>{
                return (e) => {
                    document.getElementById("foto_perfil").innerHTML = ['<img width="200" height="200" class="rounded mx-auto d-block" alt="..." src="',
                    e.target.result,'" title="',escape(theFile.name),'"/>'].join('');
                };
            })(f);
            reader.readAsDataURL(f);
        }
    }

    vistraRegistrar() {
        window.location = URL + "Registrar/registrar";
    }


    //muestro el alert de bootstrap
    visibleALert() {
        var alerta1 = document.getElementById('Alerta1');
        alerta1.style.display = 'block';
    }
    //oculto el alert de bootstrap
    ocultarALert() {
        var alerta1 = document.getElementById('Alerta1');
        alerta1.style.display = 'none';
    }

    //verifico que los dos pasworld sean iguales
    verificandopasswrod(passwrod1, password2) {
        if (passwrod1 != password2) {
            this.visibleALert();

        } else {
            this.ocultarALert();
        }
    }

    verificandopasswrod2(passwrod1, password2) {
        if (passwrod1 != password2) {
            return false;

        } else {
            return true;
        }
    }


}