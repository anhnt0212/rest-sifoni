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

      // $http.post('https://rest-sifoni-khanhicetea.c9.io/api/v1/login', JSON.stringify({
      //     email: $scope.email,
      //     password: $scope.password
      //   })).success(function(result) {
      //   console.log(result);
      // })

      // $http({
      //   method: 'POST',
      //   url: 'https://rest-sifoni-khanhicetea.c9.io/api/v1/login',
      //   headers: {
      //     'Content-Type': "application/json"
      //   },
      //   data: JSON.stringify({
      //     email: $scope.email,
      //     password: $scope.password
      //   }),
      //   responseType: "json"
      // }).then(function successCallback(response) {
      //   console.log(response);
      //   // $scope.notes = response.data;
      // }, function errorCallback(response) {
      //   console.log(response);
      // });

      fetch('https://rest-sifoni-khanhicetea.c9.io/api/v1/login', {
          method: 'post',
          body: JSON.stringify({
            email: $scope.email,
            password: $scope.password
          })
      }).then(function(response) {
          return response.json();
      }).then(function(data) {
          if ('token' in data) {
            window.localStorage.setItem('token', data.token);
            $location.path("/notes");
            $scope.$apply();
          } else {
            alert('Login fail !');
          }
      }).catch(function(err) {
         alert('Login fail !');
      });

      /*$http({
        method: 'POST',
        url: 'https://rest-sifoni-khanhicetea.c9.io/api/v1/login',
        responseType: "json",
        data: [
          email: $scope.email,
          password: $scope.password
        ]
        
      }).then(function successCallback(response) {
          if ('token' in response) {
            window.localStorage.setItem('token', response.token);
            $location.path("/nodes");
          } else {
            alert('Login fail !');
          }
        }, function errorCallback(response) {
          alert('Login fail!');
        });*/
    }
  })
  .controller('NotesController', function($scope, $http) {
    $scope.loadNotes = function () {
      /*fetch('https://rest-sifoni-anhnt0212.c9.io/api/v1/me/note', {
          method: 'get',
          headers: {
            'Authorization': 'Bearer ' + window.localStorage.getItem('token')
          }
      }).then(function(response) {
          return response.json();
      }).then(function(data) {
          $scope.notes = data;
          $scope.$apply();
      }).catch(function(err) {
         alert('Load notes fail!');
      });*/

      $http({
        method: 'GET',
        url: 'https://rest-sifoni-khanhicetea.c9.io/api/v1/me/note',
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        responseType: "json"
      }).then(function successCallback(response) {
        $scope.notes = response.data;
      }, function errorCallback(response) {
        alert('Load notes fail!');
      });
    }
    $scope.loadNotes();

    $scope.addNote = function () {
      fetch('https://rest-sifoni-khanhicetea.c9.io/api/v1/me/note', {
        method: 'post',
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
        },
        body: JSON.stringify ({
          title: $scope.note
        }) 
      }).then(function(response) {
          return response.json();
      }).then(function(data) {
          $scope.loadNotes();
      }).catch(function(err) {
         alert('Add note fail!');
      });
    }
  })
  .controller('TasksController', function($scope, $http, $routeParams) {
    $scope.showTasks = function () {
      fetch('https://rest-sifoni-khanhicetea.c9.io/api/v1/me/note/' + $routeParams.note_id, {
          method: 'get',
          headers: {
            'Authorization': 'Bearer ' + window.localStorage.getItem('token')
          }
      }).then(function(response) {
          return response.json();
      }).then(function(data) {
          $scope.tasks = data;
          for (var i = 0; i < data.length; i++) {
            if(data[i].level == 1) $scope.tasks[i].level = "primary";
            else if(data[i].level == 2) $scope.tasks[i].level = "warning";
            else $scope.tasks[i].level = "danger";

            if(data[i].status == 1) $scope.tasks[i].status = "None";
            else if(data[i].status == 2) $scope.tasks[i].status = "Pending";
            else $scope.tasks[i].status = "Completed";
          };

          $scope.$apply();
      }).catch(function(err) {
         alert('Load tasks fail!');
      });
    }
    $scope.showTasks();
  })
  .controller('RegisterController', function($scope, $html, $location) {
    fetch('https://rest-sifoni-anhnt0212.c9.io/api/v1/register', {
          method: 'post',
          body: JSON.stringify({
            username: $scope.username,
            email: $scope.email,
            password: $scope.password
          })
      }).then(function(response) {
          return response.json();
      }).then(function(data) {
          if (('token' in data) && ('user_id' in data)) {
            window.localStorage.setItem('token', data.token);
            window.localStorage.setItem('user_id', data.user_id);
            $location.path("/notes");
          } else {
            alert('Register fail !');
          }
      }).catch(function(err) {
         alert('Register fail !');
      });
  });