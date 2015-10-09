<?php

return array(
    '/api/v1' => array(
    	  '/login' =>'Api\v1\AuthController:login:login-user-api::post',


        '/me/note' => 'Api\v1\NoteController:getPost:note_get_post',
        '/me/note/{id}' => 'Api\v1\NoteController:putDelete:note_put_delete',
        '/me/task/{id}' => 'Api\v1\TaskController:putDelete:task_put_delete',
    )
);
