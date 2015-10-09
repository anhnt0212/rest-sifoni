<?php

namespace App\Model\Api;


use Sifoni\Model\Base;

class Task extends Base {
  protected $table = "task";
  protected $primarykey = "id";
  public $timestamps = false;
}
