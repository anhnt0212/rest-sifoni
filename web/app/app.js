'use strict';

angular.module('todolist', ['ngRoute'])
  .config(function($routeProvider, $locationProvider) {
      $routeProvider
        .when('/login', {
          templateUrl: 'app/templates/login.html',
          controller: 'LoginController'
        })
        .when('/register', {
          templateUrl: 'app/templates/register.html',
          controller: 'RegisterController'
        })
        .when('/forgot', {
          templateUrl: 'app/templates/forgot.html',
          controller: 'ForgotController'
        })
        .when('/notes/:note_id', {
          templateUrl: 'app/templates/tasks.html',
          controller: 'TasksController'
        })
        .when('/notes', {
          templateUrl: 'app/templates/notes.html',
          controller: 'NotesController'
        })
        .when('/tags/:tag_id', {
          templateUrl: 'app/templates/tasks.html',
          controller: 'ShowTagsController'
        })
        .otherwise({
          redirectTo: '/login'
        });
        
      $locationProvider.html5Mode(true);
  });