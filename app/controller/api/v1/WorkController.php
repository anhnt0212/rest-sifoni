<?php

namespace App\Controller\api\v1;

use Sifoni\Controller\Base;
use App\Model\api\Work;
use App\Controller\api\v1\Api;

class WorkController extends Base {
    public function indexAction($user_id) {
     	$list = Work::getallListbyUser($user_id);
     	return $this->json($list);
    }
}
