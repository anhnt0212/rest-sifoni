angular.module('todolist')
	.factory('todoService', function($http) {
		'use strict';
		var API_ENDPOINT = '/api/v1/me/';
		var config = {
			headers:{
	          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
	        },
	        responseType: "json"
		};

		return {
			get : function(endpoint) {
	           	var listNotes = $http.get(API_ENDPOINT + endpoint, config)
	           	.then(function(res) {
	                return res.data;
				});
	           	return listNotes;
	        },

	        add : function(endpoint, data) {
                return $http.post(API_ENDPOINT + endpoint, data, config);
            },

            delete : function(endpoint) {
            	return $http.delete(API_ENDPOINT + endpoint, config);
            },

            update : function(endpoint, data) {
            	return $http.put(API_ENDPOINT + endpoint, data, config);
            }
	    }
	});