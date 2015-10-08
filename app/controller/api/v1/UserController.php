<?php

namespace App\Controller\api\v1;

use Sifoni\Controller\Base;
use App\Model\api\User;
use App\Controller\api\v1\Api;

class UserController extends Base {
    public function listAction() {
     	$user = User::listUser();
     	return $this->json($user);
    }
    public function addAction(){
        
       die();
    }
    public function updateAction(){
       die();
    }
    public function deleteAction(){
       die(); 
    }    	
}
