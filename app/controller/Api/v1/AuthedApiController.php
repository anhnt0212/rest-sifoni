<?php

namespace App\Controller\Api\v1;

use App\Model\Api\User;
use Firebase\JWT\JWT;
use Symfony\Component\HttpFoundation\Response;

abstract class AuthedApiController extends ApiController {
    protected $authed_token = [];
    protected $authed = null;

    public function __construct() {
        parent::__construct();
        $authorization_header = $this->request->headers->get('Authorization');
        if (!preg_match('/^Bearer (.+)$/i', $authorization_header, $matches)) {
            $this->response->setStatusCode(Response::HTTP_UNAUTHORIZED);
            $this->response->send();

            return $this->app->terminate($this->request, $this->response);
        }

        $token = $matches[1];
        $secret = $this->app['config.app.secret'];
        $decoded_token = JWT::decode($token, $secret, ['HS256']);
        $this->authed_token = $decoded_token;
        $this->authed = User::findOrFail($decoded_token->user_id);
    }
}
