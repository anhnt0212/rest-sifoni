'use strict';

angular.module('todolist')
	.controller('TasksController', function($scope, $routeParams, $rootScope, todoService, userService, taskService) {
	    $rootScope.arrLabel = ['info', 'warning', 'danger'];
	    $rootScope.arrLevel = ['Low', 'Normal', 'High'];
	    $rootScope.arrStatus = ['None', 'Pending', 'Completed'];

	    $scope.loadTasks = function () { 
	      $rootScope.addLevel = 1;
	      todoService.get('me/note/' + $routeParams.note_id).then(function (data) {
	      	$scope.tasks = data[0].tasks;
	        for (var i = 0; i < $scope.tasks.length; i++) {
	        	var level = $scope.tasks[i].level - 1;
	        	$scope.tasks[i].level =  $scope.arrLabel[level];
	        	$scope.tasks[i].showLevel = $scope.arrLevel[level];
	        	$scope.tasks[i].status = $scope.arrStatus[$scope.tasks[i].status - 1];
	        };
	      });
	    };
	    $scope.loadTasks();

	    $scope.checkSubmitTask = function () {
	    	if(event.keyCode == 13) 
	    		$scope.addTask();
	    };

	    $scope.addTask = function () {
	      var content = $scope.addContent;
	      var tags = taskService.getTags(content);
		  content = taskService.replaceAll(content, '#', '');

		  var data = {
		  	content: content,
			level: parseInt($scope.addLevel),
			status: 1,
			note_id: parseInt($routeParams.note_id),
			tag: tags.map(function(e) {
			    return { name: e };
			})
		  };

		  $scope.addContent = "";
		  todoService.add('me/task', data).then(function (res){
		  	$scope.loadTasks();
		  }, function (res) {
		  	alert('Add task fail!');
		  });
	    };

	    $scope.del_task = function(task_id) {    
		  todoService.delete('me/task/' + task_id)
		  	.then(function (res) {
		  		$scope.loadTasks();
		  	}, function (res) {
		  		alert('Delete task fail!');
		  	})
	    };

	    $scope.updated = function(key) {    
	      var level = null;
	      for (var i = 0; i < $scope.arrLabel.length; i++) {
	      	if ($scope.tasks[key].level == $scope.arrLabel[i]) {
	      		level = i+1;
	      		break;
	      	}; 
	      };
	      var status = null;
	      if($('#status_'+key).prop('value') == '0') {
	        for (var i = 0; i < $scope.arrStatus.length; i++) {
	        	if ($scope.arrStatus[i] == $scope.tasks[key].status) {
	        		status = i + 1;
	        	};
	        };
	      }
	      else {
	        status = parseInt($('#status_'+key).prop('value'));
	      }

		  var data = {
		  	content: $('#content_'+key).prop('value'),
			level: level,
			status: status,
			note_id: parseInt($scope.tasks[key].note_id)
		  };

		  todoService.update('me/task/' + $scope.tasks[key].id, data)
		  	.then(function (res) {
		  		$scope.loadTasks();
		  	}, function (res) {
		  		alert('Update task fail!');
		  	});
	    };
	    
	    $scope.backUrl = function() {
	      window.history.back();
	    };
	    
	    $scope.logout = function() { userService.logout(); };
	    
	    $scope.checkTaskContent = function(key) {
	    	if(event.keyCode == 13) 
	    		$scope.updated(key);
	    };
	});