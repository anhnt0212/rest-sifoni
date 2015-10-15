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
        $tag->task_id = $this->post_data['task_id'];
        $tag->save();
        return $this->json($tag->toArray());
      }
    }
    public function putDeleteAction($id){
      $tag = Tag::findOrFail($id);
      if ($this->method == 'PUT') {
        $tag->name = $this->post_data['name'];
        $tag->task_id = $this->post_data['task_id'];
        $tag->save();

        return $this->json($tag->toArray());
      } elseif ($this->method == 'DELETE') {
        try {
            $tag->delete();
        } catch (\Exception $e) {
          return $this->json(['status' => 0]);
        }
        return $this->json(['status' => 1]);
      }
      return $this->fail('Fucking fail');
    }
}
