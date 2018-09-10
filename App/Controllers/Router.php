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

                case 'Login':
                    $frm_login->loadView('Login');
                break;
                
                case 'Estado':
                    $frm_login->loadView('Estado');
                break;
            }

        }
    }

    public function __destruct(){
        //unset($this);
    }
}