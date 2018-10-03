<?php

class RegionesModel extends Model{
    private $id_region;
    private $nombre;
    private $capital_regional;
    private $extencion_territorial;
    private $ubicacion_geografica;
    private $numero_habitantes;
    private $mapa;
    private $id_estado;

    public function create( $region_data = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "INSERT INTO regiones(id_region, nombre, capital_regional, extencion_territorial, ubicacion_geografica, numero_habitantes, mapa, id_estado) 
                        VALUES ($id_region, '$nombre', '$capital_regional', '$extencion_territorial', '$ubicacion_geografica', '$numero_habitantes', '$mapa','$id_estado')";

        $this->setQuery();
    }

    public function read( $id_region ='' ){
        $this->query = ( $id_region != '') 
                        ? "SELECT * FROM regiones WHERE id_region = $id_region;" 
                        : "SELECT * FROM regiones;";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $region_data = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE regiones SET id_region = $id_region, nombre = '$nombre', 
                        contrasena = '$contrasena', tipo_usuario = '$tipo_usuario', nombre = '$nombre', 
                        apellidos = '$apellidos', correo_electronico = '$correo_electronico' 
                        WHERE id_usuario = $id_usuario";

        $this->setQuery();
    }

    public function delete( $id_region = '' ){
        $this->query = "DELETE FROM regiones WHERE id_region = $id_region";
        $this->setQuery();
    }


}