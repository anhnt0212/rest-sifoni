<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Task;
use Symfony\Component\HttpFoundation\Response;

class NoteController extends AuthedApiController {
    public function getPostAction()
    {
      if ($this->method == 'GET') {
        $tasks = Task::where('list_id', '=', $this->post_data['id'])->get();
        return $this->json($tasks->toArray());
      } elseif ($this->method == 'POST') {
        $task = new Task();
        $task->name = $this->post_data['name'];
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
        $task->name = $this->post_data['name'];
        $task->level = $this->post_data['level'];
        $task->tag_id = $this->post_data['tag_id'];

        $task->save();

        return $this->json(task->toArray());
      } elseif ($this->method == 'DELETE') {
        try {
            $task->delete();
        } catch (\Exception $e) {
          return $this->json(['status' => 0]);
        }


        return $this->json(['status' => 1]);
      }

      return $this->fail('Fucking fail');
    }
}
