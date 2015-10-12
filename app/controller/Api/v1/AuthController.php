<?php

namespace App\Controller\Api\v1;


use App\Model\Api\User;
use Firebase\JWT\JWT;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends ApiController {

    public function loginAction() {
        $email = $this->post_data['email'];
        $password = $this->post_data['password'];
        $user = User::where('email', '=', $email)->first();
        if ($user) {
              if ($user->password == md5($password) && $user->status == 1) {
                $secret = $this->app['config.app.secret'];
                $token = array(
                    'user_id' => $user->id
                );
                $encoded_token = JWT::encode($token, $secret, 'HS256');
                return $this->json([
                    'user_id' => $user->id,
                    'token' => $encoded_token
                ]);
            } else {
                return $this->fail('Wrong password or not verified', Response::HTTP_BAD_REQUEST);
            }
        } else {
            return $this->fail('User is not exists', Response::HTTP_BAD_REQUEST);
        }

    }
    public function registerAction() {
        $email = $this->post_data['email'];
        $password = $this->post_data['password'];
        $user = User::where('email', '=', $email)->first();
        if ($user) {
            return $this->fail('Email already exists ', Response::HTTP_BAD_REQUEST);
        } else {
          $user = new User();
          $user->username = $this->post_data['username'];
          $user->password = md5($this->post_data['password']);
          $user->email = $this->post_data['email'];
          $user->status = 1;
          $user->save();
          if ($user->password == md5($password) && $user->status == 1) {
              $secret = $this->app['config.app.secret'];
              $token = array(
                  'user_id' => $user->id
              );
              $encoded_token = JWT::encode($token, $secret, 'HS256');
              return $this->json([
                  'mess' => 'Thành công',
                  'user_id' => $user->id,
                  'token' => $encoded_token
              ]);
          } else {
              return $this->fail('Database error', Response::HTTP_BAD_REQUEST);
          }
    }

  }
}
