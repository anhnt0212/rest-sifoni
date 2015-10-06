<?php

namespace App\Controller\api\v1;

use Sifoni\Controller\Base;
use App\Model\api\User;
use App\Controller\api\v1\Api;

class UserController extends Api {

    public function listAction() {

     	$user = User::listUser();
     	return $this->json($user);
    }
    public function addAction(){
        echo "addCOntroller";die();
    }
    public function updateAction(){
    	echo  "updateController";die();
    }
    public function deleteAction(){
        echo  "detete Controller";die();
    }    	
}
