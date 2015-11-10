<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Note;
use App\Model\Api\Task;
use App\Model\Api\Tag;
use App\Model\Api\Tag_has_task;
use Symfony\Component\HttpFoundation\Response;

class NoteController extends AuthedApiController {
    public function getPostAction()
    {
      if ($this->method == 'GET') {
        $notes = Note::where('user_id', '=', $this->authed->id)->get();
        return $this->json($notes->toArray());
      } elseif ($this->method == 'POST') {
        $note = new Note();
        $note->title = $this->post_data['title'];
        $note->user_id = $this->authed->id;
        $note->save();

        return $this->json($note->toArray());
      }

      return $this->fail('Fucking fail');
    }

    public function putDeleteAction($id)
    {
      $note = Note::findOrFail($id);
      if ($this->method == 'PUT') {
        $note->title = $this->post_data['title'];
        $note->user_id = $this->authed->id;
        $note->save();

        return $this->json($note->toArray());
      } if ($this->method == 'DELETE') {
        try {
            $note->delete();
        } catch (\Exception $e) {
          return $this->json(['status' => 0]);
        }
        return $this->json(['status' => 1]);
      }
      if ($this->method == 'GET') {
            $notes = Note::where('user_id', '=', $this->authed->id)->where('id','=',$id)->select('title','id','updated')->get()->toArray();
            foreach ($notes as &$n) {
              $count = Task::where('note_id', '=', $id)->count('id');
              $n['count_task'] = $count;
              $n['tasks'] = Task::where('note_id', '=', $id)->get()->toArray();
              // dump($n['tasks']);
              // dump($notes);
              $tag_id =  array();
              foreach ($n['tasks'] as &$key ) {
                $tag_id = $tag_id= Tag_has_task::where('task_id','=',$key['id'])->select('tag_id')->get();
                foreach ($tag_id as &$tag_id ) {
                  $tag_id['count_tag']= Tag::where('id', '=', $tag_id['tag_id'])->count('id');
                  $tag_id['tag']= Tag::where('id', '=',$tag_id['tag_id'])->get()->toArray();
                }
                $key['count_tag'] = $tag_id['count_tag'];
                $key['tag'] = $tag_id['tag'];
              }
            }
            return $this->json($notes);
      }
      return $this->fail('Fucking fail');
    }
}
