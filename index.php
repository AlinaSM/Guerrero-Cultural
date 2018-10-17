<?php
require_once('App/Controllers/Autoload.php');
$autoload = new Autoload();

if(isset($_GET['t'])){
    if($_GET['t'] == 'admin'){
        $route =  $_GET['r'] != '' ? 'admin'.$_GET['r'] : 'Login';
        
    }elseif($_GET['t'] == 'pages'){
        $route =  isset($_GET['r']) ? 'Home' : $_GET['r'] ;
    }
    $gro_cultural = new Router( $route );
    
}else{
    header('Location: pages/Home');
}

?>