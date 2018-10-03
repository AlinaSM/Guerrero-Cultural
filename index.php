<?php
require_once('App/Controllers/Autoload.php');
$autoload = new Autoload();



if(isset($_GET['r'])){
    $route =  isset($_GET['r']) ? $_GET['r'] : 'Home' ;
    $gro_cultural = new Router( $route );
}else{
    $route_admin =  isset($_GET['a']) ? $_GET['a'] : 'Login' ;
    $gro_cultural_admin = new Router( $route_admin );
}


//require_once('App/Views/Head.php');
//require_once('App/Views/Header.php');
//require_once('App/Views/Footer.php');

?>