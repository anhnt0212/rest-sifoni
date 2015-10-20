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
       if($this->method == 'GET') {
          $tags = Tag::join('tag_has_task','tag.id','=','tag_has_task.tag_id')->where('id','=',$id)->get()->toArray();
          $tg_id = array();
          foreach ($tags as &$t) {
            $tg_id = $t['task_id'];
            $t['task']= Task::where('id', '=', $t['task_id'] )->get()->toArray();
        }
        return $this->json($tags);
      }
      return $this->fail('Fucking fail');
    }
}
