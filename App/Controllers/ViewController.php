<?php

class ViewController{
    private static $view_path = './App/Views/';

    public function loadView( $view ){
        

        if($view != 'Admin'){
            require_once(self::$view_path .'Head.php');
            require_once(self::$view_path . 'Header.php');
            require_once(self::$view_path . $view . '.php');
            require_once(self::$view_path . 'Footer.php');
        }else{
            require_once(self::$view_path . $view . '.php');
        }
    }

    public function __destruct(){
        //unset($this);
    }
}