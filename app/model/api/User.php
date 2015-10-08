<?php

namespace App\Model\api;


use Sifoni\Model\Base;

class User extends Base {
  protected $table = "user";
  protected $primarykey = "id";
  public $timestamps = false;
  protected $hidden = ['password'];

  public function listUser(){
  	$user =User::where('status','=','1')->get()->toArray();
  	return $user;
  }
  public function getUserbyId($id){
  	$user=User::where('status','=','1')->where('id','=',$id)->first();
  	return $user;
  }
} 
