<?php
//require_once('Model.php');

class UsuariosModel extends Model{
    private $id_usuario;
    private $nombre_usuario;
    private $contrasena;
    private $tipo_usuario;
    private $nombre;
    private $apellidos;
    private $correo_electronico;

    public function create( $usuario_data = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "INSERT INTO usuarios(id_usuario, nombre_usuario, contrasena, tipo_usuario, nombre, apellidos, correo_electronico) 
                        VALUES ($id_usuario, '$nombre_usuario', '$contrasena', '$tipo_usuario', '$nombre', '$apellidos', '$correo_electronico')";

        $this->setQuery();
    }

    public function read( $id_usuario ='' ){
        $this->query = ( $id_usuario != '') 
                        ? "SELECT * FROM usuarios WHERE id_usuario = $id_usuario;" 
                        : "SELECT * FROM usuarios;";
        $this->getQuery();

        return $this->rows;
    }

    public function update( $usuario_data = array() ){
        foreach($usuario_data as $key => $value){
            //Variables variables (variable dinamica)
            $$key = $value;
        }

        $this->query = "UPDATE usuarios SET id_usuario = $id_usuario, nombre_usuario = '$nombre_usuario', 
                        contrasena = '$contrasena', tipo_usuario = '$tipo_usuario', nombre = '$nombre', 
                        apellidos = '$apellidos', correo_electronico = '$correo_electronico' WHERE id_usuario = $id_usuario";

        $this->setQuery();
    }

    public function delete( $id_usuario = '' ){
        $this->query = "DELETE FROM usuarios WHERE id_usuario = $id_usuario";
        $this->setQuery();
    }


}