<?php

return array(
    '/' => array(
        '/' => 'HomeController:index:home::get',
        '/hello/{name}' => 'HomeController:hello:hello_person:name=world'
    ),
    '/api/v1' => array(
    	'/login' =>'api\v1\UserController:login:login-user-api::get',
        '/users' => 'api\v1\UserController:list:list-user-api::get',
        '/users/add' => 'api\v1\UserController:add:add-user-api::post',
        '/users/{id}' => 'api\v1\UserController:update:update-user-api::put',
        '/users/delete/{id}' => 'api\v1\UserController:delete:delete-user-api',
    )
);
