<?php 

namespace App;

use Helper\System;

/**
 * Class Request
 */
class Request {

    private $paths = [
        'main' => [
            'class' => 'App\\MainController', 
            'main' => '', 
            'error404' => ''
        ], 
        'forecast' => [
            'class' => 'App\\ForecastController', 
            'main' => ''
        ]
    ];

    private $defaults = [
        'controller' => 'main', 
        'action' => 'main'
    ];

    public $clientUri = '';
    private $firstUriItem = 1;

    public $method = 'GET';
    public $controller = '';
    public $action = '';
    public $classPath = '';
    public $params = null;
    public $error = '';

    public function __construct() {
        $this->create();
    }

    private function create(): void {
        $this->method = $_SERVER['REQUEST_METHOD'];

        $len = mb_strpos($_SERVER['REQUEST_URI'], '?');
        $uri = $_SERVER['REQUEST_URI'];
        $params = '';

        if( $len > 0 ) {
            $uri = mb_substr($_SERVER['REQUEST_URI'], 0, $len);
            $params = mb_substr($_SERVER['REQUEST_URI'], $len);
        }

        $arr_tmp = explode( '/', $uri );
        $count = count( $arr_tmp );
        $arr_uri = [];

        for( $i = 0; $i < $count; $i++ ) {
            $arr_tmp[$i] = System::cleanString($arr_tmp[$i]);

            if( !empty( $arr_tmp[$i] ) ) {
                $arr_uri[] = $arr_tmp[$i];
            }
        }

        $index = $this->firstUriItem;

        if( empty( $arr_uri[$index] ) ) {
            $this->controller = $this->defaults['controller'];
        } else {
            $this->controller = $arr_uri[$index];
            $this->clientUri .= $arr_uri[$index] . '/';
        }

        $index++;

        $this->params = new \stdClass();
	
        if( empty( $arr_uri[$index] ) ) {
            $this->action = $this->defaults['action'];
        } else {
            if( is_numeric( $arr_uri[$index] ) ) {
                $this->action = $this->defaults['action'];
                $this->params->id = $arr_uri[$index];
            } else {
                $this->action = $arr_uri[$index];
            }
            $this->clientUri .= $arr_uri[$index] . '/';
        }

        $index++;
	
        if( !empty( $arr_uri[$index] ) ) {
            $this->params->id = $arr_uri[$index];
            $this->clientUri .= $arr_uri[$index] . '/';
        }

        if( isset( $_POST ) && is_array( $_POST ) ) {
            $this->params->post = new \stdClass();

            foreach( $_POST as $k => $v ) {
                $this->params->post->$k = $v;
            }
        }

        if( isset( $_GET ) && is_array( $_GET ) ) {
            $this->params->get = new \stdClass();

            foreach( $_GET as $k => $v ) {
                $this->params->get->$k = $v;
            }
        }

        $this->clientUri .= $params;

        if( !isset( $this->paths[$this->controller]['class'] ) 
            || !isset( $this->paths[$this->controller][$this->action] )
            || $this->paths[$this->controller][$this->action] == 'class' 
        ) {
            $this->error = 'ERR_1002';
        } else {
            $this->classPath = $this->paths[$this->controller]['class'];
        }
    }
}

?>