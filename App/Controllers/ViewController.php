<?php

class ViewController{
    private static $view_path = './App/Views/';
    private static $view_admin_path = './App/Views/Admin/';

    public function loadView( $view ){
        

        if( $view != 'Login' && $view != 'Admin' && $view != 'adminEstado' && 
        $view != 'adminMunicipios' && $view != 'adminRegiones' && $view != 'adminTradiciones' &&
        $view != 'adminSitiosInteres' && $view != 'adminFlora' && $view != 'adminFauna' 
        && $view != 'adminReligiones' && $view != 'adminLenguajes' ){
            require_once(self::$view_path .'Head.php');
            require_once(self::$view_path . 'Header.php');
            require_once(self::$view_path . $view . '.php');
            require_once(self::$view_path . 'Footer.php');
        }else{
            require_once(self::$view_admin_path . 'head.php');
            require_once(self::$view_admin_path . 'header.php');
            require_once(self::$view_admin_path . $view . '.php');
            require_once(self::$view_admin_path . 'footer.php');
            
        }

    }

    public function __destruct(){
        //unset($this);
    }
}