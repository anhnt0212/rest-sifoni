'use strict';

angular.module('todolist')
	.controller('NotesController', function($scope, $http, $location, todoService) {
	    $scope.loadNotes = function () {
			todoService.get('note').then(function(data) {
	            $scope.notes = data;
	        });
	    };
	    $scope.loadNotes();

	    $scope.checkSubmitNote = function () {
	    	if(event.keyCode == 13) 
	    		$scope.addNote();
	    };

	    $scope.addNote = function () {
		  todoService.add('note', {title: $scope.note}).then(function (res){
		  	$scope.loadNotes();	
		  }, function (res) {
		  	alert('Add note fail!');
		  });
	      $scope.note = "";
	    };

	    $scope.del_note = function(note_id) {    
		  todoService.delete('note/' + note_id)
		  	.then(function (res) {
		  		$scope.loadNotes();
		  	}, function (res) {
		  		alert('Delete notes fail!');
		  	})
	    };
	    
	    $scope.logout = function() {
	      window.localStorage.removeItem('token');
	      $location.path('/login');
	    };
	    
	  })

	  .controller('TasksController', function($scope, $http, $routeParams, $rootScope, $location, todoService) {
	    $scope.arrLabel = ['info', 'warning', 'danger'];
	    $scope.arrLevel = ['Low', 'Normal', 'High'];
	    $scope.arrStatus = ['None', 'Pending', 'Completed'];

	    $scope.loadTasks = function () { 
	      $rootScope.addLevel = 1;
	      todoService.get('note/' + $routeParams.note_id).then(function (data) {
	      	$scope.tasks = data[0].tasks;
	        for (var i = 0; i < $scope.tasks.length; i++) {
	        	$scope.tasks[i].level =  $scope.arrLabel[$scope.tasks[i].level - 1];
	        	$scope.tasks[i].showLevel = $scope.arrLevel[$scope.tasks[i].level - 1];
	        	$scope.tasks[i].status = $scope.arrStatus[$scope.tasks[i].status - 1];

	          // if($scope.tasks[i].level == 1) {$scope.tasks[i].level = "info"; $scope.tasks[i].showLevel = "Low";}
	          // else if($scope.tasks[i].level == 2) {$scope.tasks[i].level = "warning"; $scope.tasks[i].showLevel = "Normal";}
	          // else {$scope.tasks[i].level = "danger"; $scope.tasks[i].showLevel = "High";}

	          // if($scope.tasks[i].status == 1) $scope.tasks[i].status = "None";
	          // else if($scope.tasks[i].status == 2) $scope.tasks[i].status = "Pending";
	          // else $scope.tasks[i].status = "Completed";
	        };
	      });
	    };
	    $scope.loadTasks();

	    $scope.checkSubmitTask = function () {
	    	if(event.keyCode == 13) 
	    		$scope.addTask();
	    };

	    $scope.addTask = function () {
		  var data = {
		  	content: $scope.addContent,
			level: parseInt($scope.addLevel),
			status: 1,
			note_id: parseInt($routeParams.note_id)
		  };

		  todoService.add('task', data).then(function (res){
		  	$scope.loadTasks();
		  }, function (res) {
		  	alert('Add task fail!');
		  });
	      $scope.content = "";
	    };

	    $scope.del_task = function(task_id) {    
		  todoService.delete('task/' + task_id)
		  	.then(function (res) {
		  		$scope.loadTasks();
		  	}, function (res) {
		  		alert('Delete task fail!');
		  	})
	    };

	    $scope.updated = function(key) {    
	      var level = null;
	      // if($scope.tasks[key].level == 'info') level = 1;
	      // else if($scope.tasks[key].level == 'warning') level = 2;
	      // else level = 3;
	      for (var i = 0; i < $scope.arrLabel.length; i++) {
	      	if ($scope.tasks[key].level == $scope.arrLabel[i]) {
	      		level = i+1;
	      		break;
	      	}; 
	      };
	      var status = null;
	      if($('#status_'+key).prop('value') == '0') {
	        // if($scope.tasks[key].status == 'None') status = 1;
	        // else if($scope.tasks[key].status == 'Pending') status = 2;
	        // else status = 3;
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

		  todoService.update('task/' + $scope.tasks[key].id, data)
		  	.then(function (res) {
		  		$scope.loadTasks();
		  	}, function (res) {
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
	    
	    $scope.checkTaskContent = function(key) {
	    	if(event.keyCode == 13) 
	    		$scope.updated(key);
	    }
	});