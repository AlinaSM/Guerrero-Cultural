<?php

class MunicipiosModel extends Model{
    

    public function create( $tipo_tradicion = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }
        
        $this->query = "INSERT INTO municipios( id_municipio, nombre, clima, numero_habitantes, historia_general, escudo, mapa, id_region) 
                        VALUES ( '$id_municipio', '$nombre', '$clima', '$numero_habitantes', '$historia_general', '$escudo', '$mapa', '$id_region')";

        $this->setQuery();
    }

    public function read( $id ='' ){
        $this->query = ( $id != '') 
                        ? "SELECT * FROM municipios WHERE id_municipio = $id;" 
                        : "SELECT * FROM municipios;";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $data = array() ){
        foreach($data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE municipios SET 
                            id_municipio = '$id_municipio',
                            nombre = '$nombre',
                            clima = '$clima', 
                            numero_habitantes = '$numero_habitantes', 
                            historia_general = '$historia_general', 
                            escudo = '$escudo', 
                            mapa = '$mapa', 
                            id_region = '$id_region'
                        WHERE id_tipo_tradicion = $id";

        $this->setQuery();
    }

    public function delete( $id = '' ){
        $this->query = "DELETE FROM municipios WHERE id_municipio = $id";
        $this->setQuery();
    }


}