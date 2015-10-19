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

  .controller('TasksController', function($scope, $http, $routeParams, $rootScope, $location) {
    $scope.loadTasks = function () { 
      $rootScope.addLevel = 1;
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
          if($scope.tasks[i].level == 1) {$scope.tasks[i].level = "info"; $scope.tasks[i].showLevel = "Low";}
          else if($scope.tasks[i].level == 2) {$scope.tasks[i].level = "warning"; $scope.tasks[i].showLevel = "Normal";}
          else {$scope.tasks[i].level = "danger"; $scope.tasks[i].showLevel = "High";}

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
          content: $scope.addContent,
          level: parseInt($scope.addLevel),
          status: 1,
          note_id: parseInt($routeParams.note_id)
        }),
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.loadTasks();
      }, function errorCallback(response) {
        alert('Add task fail!');
      });
      $scope.addContent = "";
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

    $scope.updated = function(key) {  
      $('#content_'+key).attr('readonly', "");  
      $('#status_'+key).attr('disabled', "");  
      $('#update_'+key).attr('disabled', "");  
      $('#edit_'+key).removeAttr('disabled');  
      var level = null;
      if($scope.tasks[key].level == 'info') level = 1;
      else if($scope.tasks[key].level == 'warning') level = 2;
      else level = 3;
      var status = null;
      if($('#status_'+key).prop('value') == '0') {
        if($scope.tasks[key].status == 'None') status = 1;
        else if($scope.tasks[key].status == 'Pending') status = 2;
        else status = 3;
      }
      else {
        status = parseInt($('#status_'+key).prop('value'));
      }
      $http({
        method: 'PUT',
        url: '/api/v1/me/task/' + $scope.tasks[key].id,
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        data: JSON.stringify({
          content: $('#content_'+key).prop('value'),
          level: level,
          status: status,
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
      $('#content_'+key).removeAttr('readonly');
      $('#status_'+key).removeAttr('disabled');
      $('#edit_'+key).attr('disabled', "");  
      $('#update_'+key).removeAttr('disabled');
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
  