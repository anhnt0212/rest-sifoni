<?php

namespace App\Model\api;


use Sifoni\Model\Base;

class Auth extends Base {
  protected $table = "user";
  protected $primarykey = "id";
  public $timestamps = false;

  public function checkLogin($postData) {
         $username = $postData['username'];
         $password = $postData['password'];
         $auth = Auth::where('username', '=', $username)->first();
         if ($auth && $auth->password == md5($password) && $auth->status == 1) {
             return $auth;
         }
         return false;
     }
}
