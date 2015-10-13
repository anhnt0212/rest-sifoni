<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Tag;
use App\Model\Api\Task;
use App\Model\Api\Note;
use Sifoni\Model\DB;
use Symfony\Component\HttpFoundation\Response;

class TagController extends AuthedApiController {
    public function PostAction()
    {
      if ($this->method == 'POST') {
        $tag = new Tag();
        $tag->name = $this->post_data['name'];
        $tag->save();
        return $this->json($tag->toArray());
      }
    }
    public function putDeleteAction($id){
      
    }
}
