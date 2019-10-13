class Articulos {
    _construct() {

    }

    traerArticulos() {
        $.ajax({
            url: URL + "Articulo/getArticulos",
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: (response) => {

                let item = JSON.parse(response);
                if (0 < item.results.length) {
                    for (let i = 0; i < item.results.length; i++) {
                        this.cargarArticulos(item.results[i].art_id, item.results[i].art_imagen, item.results[i].art_titulo, item.results[i].art_descripcion, item.results[i].aut_nombre, item.results[i].aut_imagen, item.results[i].art_fechac);
                    }

                }
                console.log(item);

            }
        });
    }

    cargarArticulos(idarticulo, imagen, titulo, descripcion, autorname, imageautor, fecha) {

        var card =
            `<div class="card mt-2">
           <img src="./plantilla_principal/images/articulo.jpg" width="1110" height="200">
           <div class="card-body">
            <div class="ml-2">
                <h3><a href="#" onclick="loadarticulo(`+ idarticulo + `)">`+ titulo + `</a></h3>
            </div>
            <p class="card-text">`+ descripcion.substr(0, 400) + `</p>
            <a onclick="loadarticulo(`+ idarticulo + `)" class="btn btn-primary">Leer mas..</a>
        </div>
        <div class="card-footer">

            <div class="row">
                <div class="col-6">
                    Publicado Por:
                    <img src="./Resource/fotos_autores/`+ imageautor + `" class="img-thumbnail" width="40" height="200"
                        alt="...">
                    <a>`+ autorname + `</a>
                </div>
             
                <div class="col-6">
                <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">(4) Me gusta</button>
                            <button type="button" class="btn btn-danger">(5) No me gusta</button>

                        </div>
                    <a class="text-muted ml-5">
                        Publicado `+ fecha + `
                    </a>
                </div>

            </div>

        </div>
    </div>`;
        $("#articulos1").append(card);
    }

    traerArticulo2(id) {
        console.log(id)
        var data = new FormData();
        data.append('id', id);

        $.ajax({
            url: URL + "Articulo/getArticulo",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: (response) => {
              
                let item = JSON.parse(response);
                if (0 < item.results.length) {
                    for (let i = 0; i < item.results.length; i++) {
                        this.cargarArticulos2(item.results[i].art_id, item.results[i].art_imagen, item.results[i].art_titulo, item.results[i].art_descripcion, item.results[i].aut_nombre, item.results[i].aut_imagen, item.results[i].art_fechac);
                    }

                }
                
                

            }
        });
    }

    cargarArticulos2(idarticulo, imagen, titulo, descripcion, autorname, imageautor, fecha) {

        var card =
            ` <div class="card mt-2">
            <div class="text-center">
                <h3><a href="#">`+ titulo + `</a></h3>
            </div>
            <img src="../plantilla_principal/images/articulo.jpg" width="1110" height="200">
            <div class="card-body" id=>
                <p class="card-text">
                `+ descripcion + `
                </p>

            </div>
            <div class="card-footer">

                <div class="row">
                    <div class="col-6">
                        Publicado Por:
                        <img src="../Resource/fotos_autores/`+ imageautor + `" class="img-thumbnail" width="40" height="200"
                        alt="...">
                    <a>`+ autorname + `</a>
                    </div>
                    <div class="col-6">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">(4) Me gusta</button>
                            <button type="button" class="btn btn-danger">(5) No me gusta</button>

                        </div>
                        <a class="text-muted ml-5">
                        Publicado `+ fecha + `
                        </a>
                    </div>

                </div>

            </div>
        </div>`;
        $("#post").append(card);
    }
}