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
	})

	.factory('taskService', function() {
		return {
			getTags : function(content) {
			  var tags = [];
		      var t = 0;
		      for (var i = 0; i < content.length; i++) {
		      	if(content[i] == '#') {
		      		tags[t] = '';
		      		for (var j = i + 1; j < content.length; j++) {
		      			i++;
		      			if(content[j] == ' ') break;
		      			tags[t] += content[j];
		      		};
		      		t++;
		      	}
		      }; 
		      return tags;
			},

			replaceAll : function(content, target, replacement) {
		  	  return content.split(target).join(replacement);
		  	}
		}
	});