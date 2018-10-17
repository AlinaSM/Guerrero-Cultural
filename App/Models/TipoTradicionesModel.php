<?php

class TipoTradiocionesModel extends Model{
    private $id;
    private $tipo;

    public function create( $tipo_tradicion = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }
        

        $this->query = "INSERT INTO tipo_tradicion(id_tipo_tradicion, nombre) 
                        VALUES ($id, '$tipo')";

        $this->setQuery();
    }

    public function read( $id ='' ){
        $this->query = ( $id != '') 
                        ? "SELECT * FROM tipo_tradicion WHERE id_tipo_tradicion = $id;" 
                        : "SELECT * FROM tipo_tradicion;";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $usuario_data = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE tipo_tradicion SET id_tipo_tradicion = $id, 
                        nombre = '$tipo'  WHERE id_tipo_tradicion = $id";

        $this->setQuery();
    }

    public function delete( $id_usuario = '' ){
        $this->query = "DELETE FROM tipo_tradicion WHERE id_tipo_tradicion = $id";
        $this->setQuery();
    }


}