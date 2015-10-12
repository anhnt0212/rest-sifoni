<?php

namespace App\Controller\Api\v1;


use App\Model\Api\Note;
use App\Model\Api\Task;
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
        $note->content = $this->post_data['content'];
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
        $note->content = $this->post_data['content'];
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
            $tasks = Task::where('note_id', '=', $id)->get();
            return $this->json($tasks->toArray());
      }

      return $this->fail('Fucking fail');
    }
}
