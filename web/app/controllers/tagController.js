angular.module('todolist')
	.controller('ShowTagsController', function($scope, $http, $routeParams, $rootScope, todoService) {
		$scope.showTasks = function() {
			$rootScope.addLevel = 1;
			var tasks = [];
		    todoService.get('me/tag/' + $routeParams.tag_id).then(function (data) {
		    	for (var i = 0; i < data.length; i++) {
		    		tasks.push(data[i].task[0]);
		    	};
				$scope.tasks = tasks;
		        for (var i = 0; i < tasks.length; i++) {
		        	var level = $scope.tasks[i].level - 1;
		        	$scope.tasks[i].level =  $rootScope.arrLabel[level];
		        	$scope.tasks[i].showLevel = $rootScope.arrLevel[level];
		        	$scope.tasks[i].status = $rootScope.arrStatus[$scope.tasks[i].status - 1];
		        };
	      	});
		};
		$scope.showTasks();

		$scope.backUrl = function() {
	      window.history.back();
	    };
	    
	    $scope.logout = function() {
	      window.localStorage.removeItem('token');
	      $location.path('/login');
	    };
	});