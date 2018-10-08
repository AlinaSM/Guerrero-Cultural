<?php
require_once('App/Controllers/Autoload.php');
$autoload = new Autoload();

if(isset($_GET['t'])){
    if($_GET['t'] == 'admin'){
        $route =  !isset($_GET['r']) ? $_GET['r'] : 'Login' ;
        
    }elseif($_GET['t'] == 'pages'){
        $route =  !isset($_GET['r']) ? $_GET['r'] : 'Home' ;
    }
    
    $gro_cultural = new Router( $route );
    
}else{
    //$gro_cultural = new Router( "Home" );
}



?>