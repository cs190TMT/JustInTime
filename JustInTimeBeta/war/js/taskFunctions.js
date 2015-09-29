angular.module('jitTask',[]).controller('jitController', function($scope, $http){
	
	$scope.addTaskName = ""; 
	$scope.addTaskDetails = "";
	
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
	
	
	$scope.addTask = function(){
	
		if($scope.addTaskName != ""){
			var tempTaskName = $scope.addTaskName;
			
			tempTaskName = tempTaskName.trim();
		  
			if(tempTaskName != ""){
			
			
				jsonData = {
					taskName : tempTaskName,
					taskDetails : $scope.addTaskDetails
				};
				
				
				
				var addMasterTask = $http.post('addMasterTask', jsonData);
				
				addMasterTask.success(function(data, status, headers, config){
					$http.get("retrieveTaskMasterList").success(function(data, status, header, config){
						if(data.errorList.length == 0){
							
							$scope.addTaskName = "";
							$scope.addTaskDetails = "";
							
							$scope.taskList = data.taskList;
							
							var item = data.taskList[0];
							
							
							
							for(item in $scope.taskList){
								item.taskDetailsx = item.taskDetails;
							}
							
							$('#addMasterTaskModal').modal("hide");
							
							
							
							
						}
						else{
							
						}
						
						$("#taskPin"+item.id).hide();
						$("#taskPin"+item.id).show("200", "linear");
					});
					}	
				);
			}
			else{
				validateMasterTask();
			}
		}
		else{
			validateMasterTask();
		}
	}
	
	$scope.searchTask = function(){
		
		jsonData = {
			taskName : $scope.taskSearchInput
		};
		
		
		var searchMasterTask =  $http.post("search", jsonData);
		
		searchMasterTask.success(function(data, status, headers, config){
				if (data.errorList.length == 0) {
					$scope.taskList = data.taskList;
					
					for(item in $scope.taskList){
						item.taskDetailsx = item.taskDetails;
					}
				}else{
					alert('Failed to retreive tasks masterlist!');
				}
			}
		);
		
		
	}
	
	$scope.updateTask = function(btn, item){
		var idVal = item.id;
		var name = $("#input-taskName" + item.id).val();
		var details = $("#input-taskDetails" + item.id).val();
		
		
	
		jsonData = {
			id : idVal,
			taskName : name,
			taskDetails : details
			
		};
		
		

		var addMasterTask = $http.post("update", jsonData);
		
		addMasterTask.success(function(data, status, headers, config){
			if (data.errorList.length == 0) {
				
				item.taskName = $("#input-taskName" + item.id).val();
				
				item.taskDetails = $("#input-taskDetails" + item.id).val();
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


