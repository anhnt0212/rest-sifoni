<?php

namespace App\Model\api;


use Sifoni\Model\Base;

class Work extends Base {
  protected $table = "list";
  protected $primarykey = "id";
  public $timestamps = false;

  public function getallListbyUser($user_id){
  	$list = Work::join('task','list.id','=','task.list_id')->where('list.user_id','=',$user_id)->get()->toArray();
  	return $list;
  }
  public function getListbyID($id){
  	$list=Work::where('status','=','1')->where('id','=',$id)->first();
  	return $list;
  }
}
