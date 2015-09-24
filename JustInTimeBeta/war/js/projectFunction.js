var project = angular.module('project',[]);

var retrieve = project.controller('retrieve', function($scope, $http){
	$http.get("retrieveProjectList")
		.success(function(data, status, header, config){
			if(data.errorList.length == 0){
				$scope.projectList = data.projectList;
				
				//for(item in $scope.projectList){
				//	item.projectDetailsx = item.projectDetails;
				//}
				tasksReady();
			}
			else{
				
			}
			
		});
	$scope.projectEditChange = function(pin, idVal){
		
	};
});

var validate = project.controller('validate', function($scope, $http){
	
});
	/*
	$scope.updateProject = function(btn, item){
		var idVal = item.id;
		var name = item.projectName;
		var details = item.projectDetailsx;
		
		jsonData = {
			id : idVal,
			projectName : name,
			projectDetails : details
			
	};
		
		

		var addProject = $http.post("updateProject", jsonData);
		
		addProject.success(function(data, status, headers, config){
			if (data.errorList.length == 0) {
				
				item.projectDetails = item.projectDetailsx;
				//$("#tasksPin"+idVal+"updateBtn").parent().parent().find(".radical-pin-tasks-name").html(name);
				//$("#tasksPin"+idVal+"updateBtn").parent().parent().find(".radical-pin-tasks-details").html(details);
				taskPinNormalMode($("#projectsPin"+idVal+"updateBtn"));
				//retrieveTaskMasterList("TaskMasterList");
				
			} else {
				alert('Failed to retreive projects list!');
			}
		});
		
		addProject.error(function(data, status, headers, config){
				alert(data.errorList + " \nstatus: " + status);
		});
	
	}
	

	
	$scope.deleteProject = function(item){
		
		var idValue = item.id;
	
		
		var pin = $("#projectsPin"+idValue+"deleteBtn").parent().parent();

		jsonData = {
			id : idValue
		};
        
		
		
		$http.post('deleteProject', jsonData).success(
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
*/
function tasksReady() {
	$(".radical-pin-tasks-details-edit").hide();
	$(".radical-pin-tasks-name-edit").hide();
	$(".radical-task-btn-save").hide();
	$(".radical-tasks-btn-cancel").hide();
	$(".radical-tasks-btn-remove-confirm").hide();
	$(".radical-tasks-btn-cancel-2").hide();
	$(".radical-pin-tasks-remove").hide();	
}

