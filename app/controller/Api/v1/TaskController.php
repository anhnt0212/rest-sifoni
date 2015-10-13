<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Task;
use App\Model\Api\Tag;
use App\Model\Api\Note;
use Sifoni\Model\DB;
use Symfony\Component\HttpFoundation\Response;

class TaskController extends AuthedApiController {
    public function getPostAction()
    {
      if ($this->method == 'POST') {
        $task = new Task();
        $task->content = $this->post_data['content'];
        $task->note_id = $this->post_data['note_id'];
        $task->level = $this->post_data['level'];
        $task->tag_id = $this->post_data['tag_id'];
        $task->save();
        return $this->json($task->toArray());
      }
      return $this->fail('Fucking fail');
    }
    public function putDeleteAction($id)
    {
      $task = Task::findOrFail($id);
      if ($this->method == 'PUT') {
        $task = new Task();
        $task->content = $this->post_data['content'];
        $task->level = $this->post_data['level'];
        $task->tag_id = $this->post_data['tag_id'];
        $task->save();
        return $this->json($task->toArray());
      } if ($this->method == 'DELETE') {
        try {
            $task->delete();
        } catch (\Exception $e) {
          return $this->json(['status' => 0]);
        }
        return $this->json(['status' => 1]);
      }
      if($this->method == 'GET'){
        $tasks = Task::join('tag_has_task','task.id','=','tag_has_task.task_id')->where('id','=',$id)->get()->toArray();
        foreach ($tasks as $t) {
            $id_tag = $t['tag_id'];
            $tags[$id_tag]= Tag::where('id', '=', $id_tag )->get()->toArray();
        }
        dump($tags);
        foreach ($tags as $tg) {
          $t[] = $tg['id'];
          $tg['tag'] = [];
          $tasks[$tg['tag']] = $tg;
        }
        dump($tasks);
        return $this->json($tasks);
      }
      return $this->fail('Fucking fail');
    }
}
