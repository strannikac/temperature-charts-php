<?php

namespace App;

use Service\Db;
use Helper\Template;
//use Helper\System;
//use Model\LocationModel;
use Model\LocaleModel;
use Model\LanguageModel;
// use stdClass;

class App {
    private $db;
    
    private $language = null;
    private $locale = [];

    public function __construct() {
        session_start();

        $this->run();
    }

    private function run(): void {
        $this->db = Db::getInstance();
        $this->db->execSql('SET NAMES utf8;');

        $this->setLang();

        $response = null;

        if(!isset($this->language->id)) {
            //language error
            $response = new Response(null, null, [$this->locale['ERR_1000']]);
        }
        
        $this->setLocale($this->language->id);
        
        $request = new Request();

        if(!empty($request->error)) {
            //request error
            $response = new Response(null, null, [$this->locale[$request->error]]);
        }

        if(empty($response)) {
            $class = $request->classPath;
            $controller = new $class($request);
            $controller->setLocale($this->locale);
            $controller->setLanguage($this->language);

            $action = $request->action;
            $controller->$action();

            $response = $controller->getResponse();
        }

        $response->getController($response->setController($request->controller));
        $response->getAction($response->setAction($request->action));

        $response->show();

        /*$this->setLangs();

        $requestData = $this->getRequestData();

        if($requestData) {
            $requestData['defaults'] = $this->defaults;
            $requestData['clientUri'] = $this->clientUri;

            $this->setCurrencies($requestData['language']['id']);

            $requestData['currencies'] = $this->currencies;

            $class = $this->controllers[$requestData['controller']]['class'];
            $controller = new $class($requestData);
            $controller->setLocale($this->locale);

            $action = $requestData['action'];
            $controller->$action();

            $this->response = ['controller' => $requestData['controller'], 'action' => $requestData['action'], 'time' => $this->now];
            $this->response['data'] = $controller->getResponse();

            $this->content = $controller->getContent();
            $this->sessionToken = $controller->getSessionToken();
        }

        $this->showResponse();*/
    }

    private function setLang(): void {
        $model = new LanguageModel();
        $result = $model->get();

        if($result) {
            $count = count($result);

            for($i = 0; $i < $count; $i++) {
                $row = $result[$i];

                if($row['is_def'] == 1) {
                    $this->language = new \stdClass();
                    $this->language->id = $row['id'];
                    $this->language->iso = $row['iso'];
                    $this->language->title = $row['title'];
                }
            }
        }
    }

    private function setLocale(int $lang): void {
        $model = new LocaleModel();
        $result = $model->get($lang);

        if($result) {
            $this->locale = $result;
        }
    }
}

?>