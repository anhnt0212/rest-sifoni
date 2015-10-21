'use strict';

angular.module('todolist')
	.controller('LoginController', function($scope, $location, userService) {
		if('token' in window.localStorage) {
		  $location.path("/notes");
		}

		$scope.submitLogin = function () {
		  var data = {
		    email: $scope.email,
	        password: $scope.password
		  };
		  userService.post('login', data)
		  .then(function successCallback(response) {
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

	.controller('RegisterController', function($scope, $location, userService) {
	    $scope.submitRegister = function() {
	      var data = {
		    username: $scope.username,
          	email: $scope.email,
          	password: $scope.password
		  };
		  userService.post('register', data)
	      .then(function successCallback(response) {
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