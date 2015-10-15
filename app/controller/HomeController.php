<?php

namespace App\Controller;
use Sifoni\Controller\Base;

class HomeController extends Base {
    public function indexAction()
    {
      return $this->render('api/home.html.twig');
    }
}
