<?php
require_once('App/Controllers/Autoload.php');
$autoload = new Autoload();

$route =  isset($_GET['r']) ? $_GET['r'] : 'Home' ;
$gro_cultural = new Router( $route );

//require_once('App/Views/Head.php');
//require_once('App/Views/Header.php');
//require_once('App/Views/Footer.php');

?>