<?php 

namespace App;

use Service\Template;

/**
 * Class Request
 */
class Response {

    private $controller = '';
    private $action = '';

    private $data = null;
    private $content = null;
    private $status = 'error';
    private $error = null;
    //public $language = null;
    //public $locale = null;

    public function __construct(?object $data = null, ?object $content = null, array $error = []) {
        $this->data = $data;
        $this->content = $content;
        $this->error = $error;

        if( empty( $this->error ) ) {
            $this->status = 'success';
        }
    }

    public function setController(string $controller): void {
        $this->controller = $controller;
    }

    public function setAction(string $action): void {
        $this->action = $action;
    }

    public function getController(): string {
        return $this->controller;
    }

    public function getAction(): string {
        return $this->action;
    }

    /**
     * show response for app (json string or html)
     */
    public function show() {
        if( !empty( $this->content->html ) ) {
            echo $this->configureHtml();
            exit;
        }

        $json = [
            'controller' => $this->controller, 
            'action' => $this->action, 
            'time' => date('Y-m-d H:i:s'), 
            'data' => $this->data, 
            'error' => $this->error, 
            'status' => $this->status
        ];

        echo json_encode( $json );
        exit;
    }

    private function configureHtml(): string {
        $tplVars = [];
        $indexVars = [];

        $tpl = new Template();
        $tpl->set( _ROOT_TPL_ . 'index.html' );

        $indexVars['_home_url_'] = _CLIENT_URL_;
        $indexVars['_domain_'] = _DOMAIN_;
        $indexVars['_path_api_'] = _SERVER_URL_;
        $indexVars['_path_html_'] = _URL_WEB_;
        $indexVars['_year_'] = date('Y');

        $indexVars['content'] = $this->content->html;
        $indexVars['meta_title'] = 'Temperature data charts';
        $indexVars['meta_description'] = 'Temperature data charts';
        $indexVars['meta_keywords'] = 'Temperature data charts';

        $tpl->setVars($indexVars);
        $html = $tpl->parse();
        
        return $html;
    }

    private function showErrorPage() {
        //header('Location: ' . _CLIENT_URL_ . $this->content['language']['iso'] . '/' . $this->content['location']['region']['url'] . '/error404/');
        header('Location: ' . _CLIENT_URL_ . 'error404/');
    }
}

?>