'use strict';

angular.module('todolist', ['ngRoute'])
  .config(['$routeProvider',
    function($routeProvider) {
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
        .otherwise({
          redirectTo: '/login'
        });
    }
  ])

  .controller('LoginController', function($scope, $http, $location) {
    $scope.login = function () {
      $http({
        method: 'POST',
        url: '/api/v1/login',
        headers: {
          'Content-Type': "application/json"
        },
        data: JSON.stringify({
          email: $scope.email,
          password: $scope.password
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        if ('token' in response.data) {
          window.localStorage.setItem('token', response.data.token);
          $location.path("/notes");
        } else {
          alert('Login fail !');
        }
      }, function errorCallback(response) {
        alert('Login fail !');
      });
    }
  })

  .controller('NotesController', function($scope, $http) {
    $scope.loadNotes = function () {
      $http({
        method: 'GET',
        url: '/api/v1/me/note',
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.notes = response.data;
      }, function errorCallback(response) {
        alert('Load notes fail!');
      });
    };
    $scope.loadNotes();

    $scope.addNote = function () {
      $http({
        method: 'POST',
        url: '/api/v1/me/note',
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          title: $scope.note
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadNotes();
      }, function errorCallback(response) {
        alert('Add note fail!');
      });
      $scope.note = "";
    };

    $scope.del_note = function(note_id) {    
      $http({
        method: 'DELETE',
        url: '/api/v1/me/note/' + note_id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadNotes();
      }, function errorCallback(response) {
        alert('Delete notes fail!');
      });
    };

  })

  .controller('TasksController', function($scope, $http, $routeParams, $rootScope) {
    $scope.loadTasks = function () {
      $rootScope.level = 1;
      $http({
        method: 'GET',
        url: '/api/v1/me/note/' + $routeParams.note_id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.tasks = response.data;
        for (var i = 0; i < response.data.length; i++) {
          if(response.data[i].level == 1) $scope.tasks[i].level = "primary";
          else if(response.data[i].level == 2) $scope.tasks[i].level = "warning";
          else $scope.tasks[i].level = "danger";

          if(response.data[i].status == 1) $scope.tasks[i].status = "None";
          else if(response.data[i].status == 2) $scope.tasks[i].status = "Pending";
          else $scope.tasks[i].status = "Completed";
        };
      }, function errorCallback(response) {
        alert('Load tasks fail!');
      });
    };
    $scope.loadTasks();

    $scope.addTask = function () {
      $http({
        method: 'POST',
        url: '/api/v1/me/task/',
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          content: $scope.content,
          level: parseInt($scope.level),
          status: 1,
          note_id: parseInt($routeParams.note_id)
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Add task fail!');
      });
      $scope.content = "";
    };

    $scope.del_task = function(task_id) {    
      $http({
        method: 'DELETE',
        url: '/api/v1/me/task/' + task_id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Delete task fail!');
      });
    };

    $scope.completed = function(task_id) {    
      $http({
        method: 'PUT',
        url: '/api/v1/me/task/' + task_id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          status: 3
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Update task fail!');
      });
    };

    $scope.editTask = function(key) {
      $('#submitTask').attr('ng-click', 'update('+ $scope.tasks[key].id + ')');
      $scope.currTask = $scope.tasks[key].content;
      var status = $scope.tasks[key].status;
      if(status == 'None') $scope.currStatus = 1;
      else if(status == 'Pending') $scope.currStatus = 2;
      else $scope.currStatus = 3; 
      $('#edit-task').modal('show');
    };

    $scope.update = function(task_id) {    
      $http({
        method: 'PUT',
        url: '/api/v1/me/task/' + task_id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          status: $scope.currStatus,
          content: $scope.currTask
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Update task fail!');
      });
    };

  })

  .controller('RegisterController', function($scope, $http, $location) {
    $scope.register = function() {
      $http({
        method: 'POST',
        url: '/api/v1/register',
        data: JSON.stringify({
          username: $scope.username,
          email: $scope.email,
          password: $scope.password
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        if ('token' in response.data) {
          window.localStorage.setItem('token', response.data.token);
          $location.path("/notes");
        } else {
          alert('Register fail !');
        }
      }, function errorCallback(response) {
        alert('Register fail!');
      });
    }
  });