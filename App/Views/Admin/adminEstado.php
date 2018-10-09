<?php
    include_once('menu.php');
?>

<div class="card m-3">
    <div class="card-header">
        <h2>Estado</h2>
    </div>
    <div class="card-body">
        <!-- <h5 class="card-title">Special title treatment</h5> --->
        <p class="card-text"><em>Aqui podras editar las propiedades del estado.</em></p>
        <br>
        
        
        <form action="" method="post">

           <div class="row">
                <div class="form-group col-lg-4">
                    <label for="nombre">Nombre del estado: </label>
                    <input type="text" name="nombre" id="" class="form-inline form-control" required>
                </div>

                <div class="form-group col-lg-4">
                    <label for="capital">Capital del estado: </label>
                    <input type="text" name="capital" id="" class="form-inline form-control" required>
                </div>

                <div class="form-group col-lg-4">
                    <label for="extencion_territorial">Extencion Territorial: </label>
                    <input type="text" name="extencion_territorial" id="" class="form-inline form-control" required>
                </div>
           </div>

           <div class="row">
                <div class="form-group col-lg-4">
                    <label for="gentilicio">Gentilicio: </label>
                    <input type="text" name="gentilicio" id="" class="form-inline form-control" required>
                </div>

                <div class="form-group col-lg-4">
                    <label for="numero_municipios">Numero de Municipios: </label>
                    <input type="text" name="numero_municipios" id="" class="form-inline form-control" required>
                </div>
           </div>

            <div class="row">
                <div class="form-group col-12">
                    <label for="descripcion">Descripcion: </label>
                    <textarea name="descripcion" id="" rows="5"  class="form-control"  required>  </textarea>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-lg-4">
                    <label for="imagen_estado">Imagen Territorial: </label>
                    <input type="text" name="imagen_estado" id="" class="form-inline form-control" required>
                </div>

                <div class="form-group col-lg-4">
                    <label for="imagen_escudo">Escudo: </label>
                    <input type="text" name="imagen_escudo" id="" class="form-inline form-control" required>
                </div>
            </div>
        </form>


        
    </div> <!-- Card-Body -->

</div>
    
