<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Task;
use App\Model\Api\Note;
use Sifoni\Model\DB;
use Symfony\Component\HttpFoundation\Response;

class TaskController extends AuthedApiController {
    public function getPostAction()
    {
      if ($this->method == 'GET') {
        $user_id = $this->authed->id;
        $notes = Note::where('user_id', '=', $user_id)->get()->toArray();
        $tasks = [];
        foreach ($notes as $n) {
          $notes_id[] = $n['id'];
          $n['tasks'] = [];
          $notes[$n['id']] = $n;
        }
        $tasks = DB::table('task')->join('list','task.list_id','=','list.id')->where('list_id','=',$note->id);
        foreach ($notes_id as $n_id) {
          $tasks->unionAll(
          DB::table('task')->join('list','task.list_id','=','list.id'));
        }
        $tasks_array = $tasks->get();
        foreach ($tasks_array as $t) {
          $notes[$t->list_id]['tasks'][]= $t;
        }
        return $this->json($notes->toArray());
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

        return $this->json($task->toArray());
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
