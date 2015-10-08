<?php

namespace App\Controller\api\v1;

use Sifoni\Controller\Base;
use App\Model\api\Auth;
use App\Controller\api\v1\Api;

class AuthController extends Base {
    public function indexAction(){
       $data = array();
       if ($this->getPostData("login")) {
            $postData = $this->getPostData();
            if (Auth::checkLogin($postData) != Null) {
                $auth = Auth::checkLogin($postData);
                $this->app['session']->set("username", $auth['username']);
                $this->app['session']->getFlashBag()->add('message', 'Đăng nhập thành công');
                // return $this->redirect('list_post', array('idcate' => $idcate));
                return $this->redirect('listbyuser-api',array('user_id' => $auth['id']));
            }
            if (Auth::checkLogin($postData) == false) {

                $data['notification'] = 'Đăng nhập thất bại vui lòng kiểm tra lại !';
                return $this->render('api/home/index.html.twig', $data);
            }
          }
       return $this->render('api/home/index.html.twig',$data);
    }
}
