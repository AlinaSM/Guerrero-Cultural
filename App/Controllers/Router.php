<?php

class Router{
    public $route;

    public function __construct($route){

        $session_options = array(
			'use_only_cookies' => 1,
			//'auto_start' => 1,
			'read_and_close' => true
        );
        
        if( !isset( $_SESSION ) )  session_start( $session_options );
        if( !isset( $_SESSION['ok'] ) ) $_SESSION['ok'] = false;

        if( $_SESSION['ok'] ){


        }else{
            $frm_login = new ViewController();

            switch($route){
                case 'Home':
                    $frm_login->loadView('Home');
                break;
                               
                case 'Estado':
                    $frm_login->loadView('Estado');
                break;

                case 'Tradiciones':
                    $frm_login->loadView('Tradiciones');
                break;
                
                case 'SitiosInteres':
                    $frm_login->loadView('SitiosInteres');
                break;
                
                case 'Flora':
                    $frm_login->loadView('Flora');
                break;
                
                case 'Fauna':
                    $frm_login->loadView('Fauna');
                break;

                // Area de la administracion del sitio
                case 'adminHome':
                    $frm_login->loadView('Admin');
                break;

                case 'Login':
                    $frm_login->loadView('Login');
                break;

                case 'adminEstado':
                    $frm_login->loadView('adminEstado');
                break;

                case 'adminMunicipios':
                    $frm_login->loadView('adminMunicipios');
                break;

                case 'adminRegiones':
                    $frm_login->loadView('adminRegiones');
                break;

                case 'adminTradiciones':
                    $frm_login->loadView('adminTradiciones');
                break;

                case 'adminSitiosInteres':
                    $frm_login->loadView('adminSitiosInteres');
                break;
                
                case 'adminFlora':
                    $frm_login->loadView('adminFlora');
                break;

                case 'adminFauna':
                    $frm_login->loadView('adminFauna');
                break;  
                
                case 'adminReligiones':
                    $frm_login->loadView('adminReligiones');
                break;

                case 'adminLenguajes':
                    $frm_login->loadView('adminLenguajes');
                break;  
                
            }

        }
    }

    public function __destruct(){
        //unset($this);
    }
}