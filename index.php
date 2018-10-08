<?php
require_once('App/Controllers/Autoload.php');
$autoload = new Autoload();

if(isset($_GET['t'])){
    if($_GET['t'] == 'admin'){//  'admin'+$_GET['r']
        $route =  $_GET['r'] != '' ? 'admin'.$_GET['r'] : 'adminLogin';
        
    }elseif($_GET['t'] == 'pages'){
        $route =  isset($_GET['r']) ? 'Home' : $_GET['r'] ;
    }

   // echo $route;
    $gro_cultural = new Router( $route );
    
}else{
    //$gro_cultural = new Router( "Home" );
}



?>