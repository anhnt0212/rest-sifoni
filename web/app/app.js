'use strict';

angular.module('todolist', ['ngRoute','ui.bootstrap','dialogs'])
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
    if('token' in window.localStorage) {
      $location.path("/notes");
    }

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

  .controller('NotesController', function($scope, $http, $location) {
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
    
    $scope.logout = function() {
      window.localStorage.removeItem('token');
      $location.path('/login');
    };
    
  })

  .controller('TasksController', function($scope, $http, $routeParams, $rootScope, $location, $dialogs) {
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
        $scope.tasks = response.data[0].tasks;
        for (var i = 0; i < $scope.tasks.length; i++) {
          if($scope.tasks[i].level == 1) $scope.tasks[i].level = "info";
          else if($scope.tasks[i].level == 2) $scope.tasks[i].level = "warning";
          else $scope.tasks[i].level = "danger";

          if($scope.tasks[i].status == 1) $scope.tasks[i].status = "None";
          else if($scope.tasks[i].status == 2) $scope.tasks[i].status = "Pending";
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
        url: '/api/v1/me/task',
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

    $scope.completed = function(key) {    
      $http({
        method: 'PUT',
        url: '/api/v1/me/task/' + $scope.tasks[key].id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          content: $scope.tasks[key].content,
          level: parseInt($scope.tasks[key].level),
          status: 3,
          note_id: parseInt($scope.tasks[key].note_id)
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Update task fail!');
      });
    };
    
    $scope.backUrl = function() {
      window.history.back();
    };
    
    $scope.logout = function() {
      window.localStorage.removeItem('token');
      $location.path('/login');
    };
    
    $scope.editTask = function(key) {
      var contentTask = $scope.tasks[key].content;
      var statusTask = $scope.tasks[key].status;
      if(statusTask == 'None') statusTask = 1;
      else if(statusTask == 'Pending') statusTask = 2;
      else statusTask = 3;

      var dlg = $dialogs.create(
        '/app/templates/update_task.html',
        'updateTaskController',
        {
          content: contentTask,
          status: statusTask
        },
        {
          key: false,
          back: 'static'
        }
      );
 
      dlg.result.then(function(task){
        $http({
          method: 'PUT',
          url: '/api/v1/me/task/' + $scope.tasks[key].id,
          headers: {
            'Authorization': 'Bearer ' + window.localStorage.getItem('token')
          },
          data: JSON.stringify({
            level: parseInt($scope.tasks[key].level),
            note_id: parseInt($scope.tasks[key].note_id),
            status: task.status,
            content: task.content
          }),
          responseType: "json"
        }).then(function successCallback(response) {
          $scope.loadTasks();
        }, function errorCallback(response) {
          alert('Update task fail!');
        });
      });
    };

  })
  
  .controller('updateTaskController',function($scope, $modalInstance, data){
    $scope.task = {
      content : data.content,
      status : data.status
      
    };
    $scope.cancel = function(){
      $modalInstance.dismiss('canceled');  
    }; // end cancel
    
    $scope.save = function(){
      data = {
        status: $scope.task.status,
        content: $scope.task.content
      }
      $modalInstance.close(data);
    }; // end save
    
    $scope.hitEnter = function(evt){
      if(angular.equals(evt.keyCode,13) && !(angular.equals($scope.content,null) || angular.equals($scope.content,'')))
  				$scope.save();
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
  