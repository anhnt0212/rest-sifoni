<?php

namespace App\Model\Api;


use Sifoni\Model\Base;

class Tag extends Base {
  protected $table = "tag";
  protected $primarykey = "id";
  public $timestamps = false;
}
