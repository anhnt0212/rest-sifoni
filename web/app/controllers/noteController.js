angular.module('todolist')
	.controller('NotesController', function($scope, todoService, userService) {
	    $scope.loadNotes = function () {
			todoService.get('me/note').then(function(data) {
	            $scope.notes = data;
	        });
	    };
	    $scope.loadNotes();

	    $scope.checkSubmitNote = function () {
	    	if(event.keyCode == 13) 
	    		$scope.addNote();
	    };

	    $scope.addNote = function () {
			todoService.add('me/note', {title: $scope.note}).then(function (res){
				$scope.loadNotes();	
			}, function (res) {
				alert('Add note fail!');
			});
			$scope.note = "";
	    };

	    $scope.del_note = function(note_id) {    
		  	todoService.delete('me/note/' + note_id)
		  	.then(function (res) {
		  		$scope.loadNotes();
		  	}, function (res) {
		  		alert('Delete notes fail!');
		  	})
	    };
	    
	    $scope.logout = function() { userService.logout(); };
	    
	  });