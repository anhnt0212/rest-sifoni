<?php

return array(
    '/' => array(
        '/' => 'HomeController:index:home::get',
        '/hello/{name}' => 'HomeController:hello:hello_person:name=world'
    ),
    '/api/v1' => array(
    	  '/login' =>'api\v1\AuthController:index:login-user-api',
      	'/register' =>'api\v1\AuthController:register:register-user-api::get',
        '/users' => 'api\v1\UserController:list:list-user-api::get',
        '/users/add' => 'api\v1\UserController:add:add-user-api::post',
        '/users/{id}' => 'api\v1\UserController:update:update-user-api::put',
        '/users/delete/{id}' => 'api\v1\UserController:delete:delete-user-api',
        '/users/list/{user_id}' => 'api\v1\WorkController:index:listbyuser-api',
    )
);
