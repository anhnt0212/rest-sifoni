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
        $nn_ids = array();
        $tasks = array();
        foreach ($notes as $n) {
          $nn_ids = $n['id'];
          $n['tasks'] = [];
          $notes[$nn_ids['id']] = $n;
        }
        $tasks = DB::table('task')->join('note','task.note_id','=','note.id')->where('note_id','=',1);
        $tasks_array = $tasks->get();
        foreach ($tasks_array as $t) {
          $notes[$t->note_id]['tasks'][]= $t;
        }
        dump($notes);die();
        //return $this->json($notes->toArray());
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
