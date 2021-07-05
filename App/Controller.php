<?php 

namespace App;

//use Service\Db;
use Helper\System;
use Service\Template;
use Helper\Validator;
// use stdClass;

class Controller {
    //protected $db;

    protected $allowedMethods = ['GET', 'POST'];

    protected $arrBool = [0,1];
    protected $validator;
    protected $template;

    protected $request = null;
    //protected $params = [];
    //protected $response = [];
    protected $data = null;
    protected $content = null;
    protected $error = [];

    protected $language = null;
    protected $locale = [];

    protected $defaults = [];
    protected $statusSuccess = 'success';
    protected $statusFail = 'error';

    // protected $dayFormat = 'd.m.Y';
    protected $dayFormat = 'm/d/Y';

    public function __construct(Request $request) {
        //$this->db = Db::getInstance();
        $this->request = $request;
        // $this->params = $this->request['params'];
        // $this->language = $this->request['language'];
        // $this->defaults = $this->request['defaults'];
        // $this->currencies = $this->request['currencies'];

        $this->validator = new Validator();
        $this->template = new Template();

        // if($this->language->id == 1) {
        //     $this->dayFormat = 'm/d/Y';
        // }

        $this->data = new \stdClass();
        $this->content = new \stdClass();
    }

    public function setLocale(array $locale): void {
        $this->locale = $locale;
    }

    public function setLanguage(\stdClass $language): void {
        $this->language = $language;
    }

    public function getResponse(): Response {
        return new Response($this->data, $this->content, $this->error);
    }
}

?>