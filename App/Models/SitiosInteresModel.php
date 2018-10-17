<?php

class SitiosInteresModel extends Model{

    private $id_interes_cult;
    private $nombre;
    private $descripcion_general;
    private $horario;
    private $direccion;
    private $imagen;
    private $id_municipio;
    private $id_tipo_interes; 
    
    public function create( $data = array() ){
        foreach($data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "INSERT INTO intereses_culturales(id_interes_cult, nombre, descripcion_general, 
                                    horario, direccion, imagen, id_municipio, id_tipo_interes) 
                        VALUES ('$id_interes_cult', '$nombre', '$descripcion_general', '$horario',
                                '$direccion', '$imagen', '$id_municipio', '$id_tipo_interes')";

        $this->setQuery();
    }

    public function read( $id ='' ){
        $this->query = ( $id != '') 
                        ? "SELECT * FROM intereses_culturales;" 
                        : "SELECT * FROM intereses_culturales WHERE id_interes_cult = '$id';";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $data = array() ){
        foreach($data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE intereses_culturales 
                            SET  id_interes_cult = $id_interes_cult, 
                                nombre = '$nombre', 
                                descripcion_general = '$descripcion_general', 
                                horario = '$horario', 
                                direccion = '$direccion', 
                                imagen = '$imagen', 
                                id_municipio = '$id_municipio' , 
                                id_tipo_interes = '$id_tipo_interes',
                            WHERE id_interes_cult = $id_interes_cult";

        $this->setQuery();
    }

    public function delete( $id = '' ){
        $this->query = "DELETE FROM intereses_culturales WHERE id_interes_cult = $id";
        $this->setQuery();
    }


}