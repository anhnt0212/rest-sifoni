angular.module('todolist')
	.factory('userService', function($http, $location) {
		'use strict';
		var API_VERSION = '/api/v1/';
		var config = {
	        responseType: "json"
		};

		return {

	        post : function(endpoint, data) {
                return $http.post(API_VERSION + endpoint, data, config);
            },

            logout : function() {
            	window.localStorage.removeItem('token');
	      		$location.path('login');
            }
	    }
	});