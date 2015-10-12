<?php

namespace App\Controller;
use Sifoni\Controller\Base;

class HomeController extends Base {
    public function indexAction()
    {
      $data = array();
      $data['title'] = 'API demo JWT';
      return $this->render('home.html.twig',$data);
    }
}
