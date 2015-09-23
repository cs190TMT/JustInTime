angular.module('jitTask',[]).controller('jitController', function($scope, $http){
	$http.get("retrieveTaskMasterList").success(function(data, status, header, config){
		if(data.errorList.length == 0){
			$scope.taskList = data.taskList;
			
			for(item in $scope.taskList){
				item.taskDetailsx = item.taskDetails;
			}
			
			
		}
		else{
			
		}
	});
	
	
	
	
	
	$scope.updateTask = function(btn, item){
		var idVal = item.id;
		var name = item.taskName;
		var details = item.taskDetailsx;
		
		jsonData = {
			id : idVal,
			taskName : name,
			taskDetails : details
			
		};
		
		

		var addMasterTask = $http.post("update", jsonData);
		
		addMasterTask.success(function(data, status, headers, config){
			if (data.errorList.length == 0) {
				
				
				item.taskDetails = item.taskDetailsx;
				//$("#tasksPin"+idVal+"updateBtn").parent().parent().find(".radical-pin-tasks-name").html(name);
				//$("#tasksPin"+idVal+"updateBtn").parent().parent().find(".radical-pin-tasks-details").html(details);
				taskPinNormalMode($("#tasksPin"+idVal+"updateBtn"));
				//retrieveTaskMasterList("TaskMasterList");
			} else {
				alert('Failed to retreive tasks masterlist!');
			}
		});
		
		addMasterTask.error(function(data, status, headers, config){
				alert(data.errorList + " \nstatus: " + status);
		});
	
	}
	

	
	$scope.deleteTask = function(item){
		
		var idValue = item.id;
	
		
		var pin = $("#tasksPin"+idValue+"deleteBtn").parent().parent();

		jsonData = {
			id : idValue
		};
        
		
		
		$http.post('delete', jsonData).success(
				function(data, status, header, config){
				
					if (data.errorList.length == 0) {
						$(pin).hide("200", "linear")
						// retrieveTaskMasterList("TaskMasterList");
					} else {
						alert('Failed to retreive tasks masterlist!');
					}
					
				}
		);
		
	}
});

function tasksReady() {
	$(".radical-pin-tasks-details-edit").hide();
	$(".radical-pin-tasks-name-edit").hide();
	$(".radical-task-btn-save").hide();
	$(".radical-tasks-btn-cancel").hide();
	$(".radical-tasks-btn-remove-confirm").hide();
	$(".radical-tasks-btn-cancel-2").hide();
	$(".radical-pin-tasks-remove").hide();
	
	
}

