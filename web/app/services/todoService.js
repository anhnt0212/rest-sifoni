angular.module('todolist')
	.factory('todoService', function($http) {
		'use strict';
		var API_VERSION = '/api/v1/';
		var config = {
			headers:{
	          'Authorization': 'Bearer ' + window.localStorage.getItem('token')
	        },
	        responseType: "json"
		};

		return {
			get : function(endpoint) {
	           	var listNotes = $http.get(API_VERSION + endpoint, config)
	           	.then(function(res) {
	                return res.data;
				});
	           	return listNotes;
	        },

	        add : function(endpoint, data) {
                return $http.post(API_VERSION + endpoint, data, config);
            },

            delete : function(endpoint) {
            	return $http.delete(API_VERSION + endpoint, config);
            },

            update : function(endpoint, data) {
            	return $http.put(API_VERSION + endpoint, data, config);
            }
	    }
	});