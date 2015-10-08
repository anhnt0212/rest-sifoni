<?php

namespace App\Model\Api;


use Sifoni\Model\Base;

class Note extends Base {
  protected $table = "note";
  protected $primarykey = "id";
  public $timestamps = false;
}
