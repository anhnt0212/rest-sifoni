<?php

namespace App\Model\Api;


use Sifoni\Model\Base;

class User extends Base {
  protected $table = "user";
  protected $primarykey = "id";
  public $timestamps = false;
  protected $hidden = ['password'];
  public function checkLogin($email,$password){
    $user = User::where('username', '=', $username)->first();
    if ($user && $user->password == md5($password) && $user->status == 1) {
        return $user;
    }
    return false;
  }

}
