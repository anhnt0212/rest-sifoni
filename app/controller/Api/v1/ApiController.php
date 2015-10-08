<?php

namespace App\Controller\Api\v1;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Sifoni\Controller\Base;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Debug\ErrorHandler;

abstract class ApiController extends Base {
    protected $method = 'GET';

    public function __construct() {
        parent::__construct();

        $this->method = $this->request->getMethod();
        if (in_array($this->method, ['POST', 'PUT'])) {
            $content = $this->request->getContent();
            $this->post_data = json_decode($content, true);
        }

        ErrorHandler::register();
        $app = $this->app;
        $app->error(function (ModelNotFoundException $e, $code) use ($app) {
            $models = explode('\\', $e->getModel());
            return $app->json([
                'error' => last($models) . ' does not exists.',
                'status_code' => Response::HTTP_NOT_FOUND
            ], Response::HTTP_NOT_FOUND);
        }, 0);
    }

    protected function fail($msg, $status_code = Response::HTTP_INTERNAL_SERVER_ERROR) {
        return $this->json([
            'error' => $msg,
            'status_code' => $status_code
        ]);
    }
}
