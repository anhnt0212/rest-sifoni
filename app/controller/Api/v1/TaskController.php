<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Task;
use App\Model\Api\Tag;
use App\Model\Api\Note;
use App\Model\Api\Tag_has_task;
use Sifoni\Model\DB;
use Symfony\Component\HttpFoundation\Response;

class TaskController extends AuthedApiController {
    public function getPostAction()
    {
      if ($this->method == 'POST') {
        if ($this->post_data['content']==NUll |$this->post_data['tag']==NUll){
          return $this->fail('Content or Tag not empty');
        }
        else{
          $abc = $this->post_data['tag'];
          $id_tag = array();
          foreach ($abc as $a) {
            $tag = new Tag();
            $tag->name = $a['name'];
            $tag->save();
            $id_tag[]['id'] = $tag->id;
          }
            if($tag->save()){
             $task = new Task();
             $task->content = $this->post_data['content'];
             $task->note_id = $this->post_data['note_id'];
             $task->level = $this->post_data['level'];
             $task->save();
             $has_tag = new Tag_has_task();
             foreach ($id_tag as $t) {
               dump($t['id']);
               $has_tag->tag_id = $t['id'];
               $has_tag->task_id = $task->id;
             }
             $has_tag->save();
             die();
             if($has_tag->save()){
               return $this->json($task->toArray());
             }//endig
             else{
               return $this->fail('Fucking fail');
             }//endelse
          }//endif
          else{
            return $this->fail('Add Tag fail');
          }//endelse
        }
      }
      return $this->fail('Fucking fail');
    }
    public function putDeleteAction($id)
    {
      $task = Task::findOrFail($id);
      if ($this->method == 'PUT') {
        $task->content = $this->post_data['content'];
        $task->level = $this->post_data['level'];
        $task->status = $this->post_data['status'];
        $task->tag_id = $this->post_data['tag_id'];
        $task->note_id = $this->post_data['note_id'];
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
      elseif($this->method == 'GET'){
        $tasks = Task::join('tag_has_task','task.id','=','tag_has_task.task_id')->where('id','=',$id)->get()->toArray();
        $tt_id = array();
        foreach ($tasks as &$t) {
            $tt_id = $t['tag_id'];
            $t['tag']= Tag::where('id', '=', $t['tag_id'] )->get()->toArray();
        }
        return $this->json($tasks);
      }
      return $this->fail('Fucking fail');
    }
}
