<?php

class EstadoModel extends Model{
    private $id_estado;
    private $nombre;
    private $capital;
    private $extencion_territorial;
    private $gentilicio;
    private $numero_municipios;
    private $descripcion;
    private $imagen_estado;
    private $imagen_escudo;

    public function create( $data = array() ){
        foreach($data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "INSERT INTO estados(id_estado, nombre, capital, extencion_territorial, gentilicio, 
                                    numero_municipios, descripcion, imagen_estado, imagen_escudo) 
                        VALUES ($id_estado, '$nombre', '$capital', '$extencion_territorial', '$gentilicio',
                                '$numero_municipios', '$descripcion', '$imagen_estado','$imagen_escudo')";

        $this->setQuery();
    }

    public function read( $id ='' ){
        $this->query = ( $id != '') 
                        ? "SELECT * FROM estados WHERE id_estado = $id;" 
                        : "SELECT * FROM estados;";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $data = array() ){
        foreach($data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE estados SET  id_estado = $id_estado, nombre = '$nombre', 
                                            capital = '$capital', extencion_territorial = '$extencion_territorial', 
                                            gentilicio = '$gentilicio', numero_municipios = '$numero_municipios', 
                                            descripcion = '$descripcion' , imagen_estado = '$imagen_estado',
                                            imagen_escudo = '$imagen_escudo'  WHERE id_estado = $id_estado";

        $this->setQuery();
    }

    public function delete( $id = '' ){
        $this->query = "DELETE FROM estados WHERE id_estado = $id";
        $this->setQuery();
    }


}