<?php

return array(
    '/api/v1' => array(
    	  '/login' =>'Api\v1\AuthController:login:login-user-api::post',
        '/register' =>'Api\v1\AuthController:register:register-user-api::post',
        '/me/note' => 'Api\v1\NoteController:getPost:note_get_post',
        '/me/note/{id}' => 'Api\v1\NoteController:putDelete:note_put_delete',
        '/me/task' => 'Api\v1\TaskController:getPost:task_get_post',
        '/me/task/{id}' => 'Api\v1\TaskController:putDelete:task_put_delete',
        '/me/tag' => 'Api\v1\TagController:Post:tag_add',
        '/me/tag/{id}' => 'Api\v1\TagController:putDelete:pug_delete_tag',
    ),
    '/' => array(
        '/' =>'HomeController:index:home-api',
    )
);
