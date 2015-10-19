'use strict';

angular.module('todolist')
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