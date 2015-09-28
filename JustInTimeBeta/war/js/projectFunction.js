var project = angular.module('project',[]);

var deleteProject = false;
var deleteCancelProject = false;
var deleteConfirm = false;
var editSaveProject = false;
var editCancelProject = false;
var editNameButton = false;
var editDetailsButton = false;
var editNameProject = true;
var editDetailsProject = true;
var InputVal;
var DeleteVal;
var projectName;
var projectDetails;

var retrieve = project.controller('retrieve', function($scope, $http){
	
	$http.get("retrieveProjectList")
		.success(function(data, status, header, config){
			if(data.errorList.length == 0){
				$scope.projectList = data.projectList;
				
				//for(item in $scope.projectList){
				//	item.projectDetailsx = item.projectDetails;
				//}
				$scope.deleteProject = deleteProject;
				$scope.deleteCancelProject = deleteCancelProject;
				$scope.editSaveProject = editSaveProject;
				$scope.editCancelProject = editCancelProject;
				$scope.editNameButton = editNameButton;
				$scope.editDetailsButton = editDetailsButton;
				$scope.deleteConfirm = deleteConfirm;
				$scope.editNameProject = editNameProject;
				$scope.editDetailsProject = editDetailsProject;
				
			}
			else{
				
			}
			
		});
	
	$scope.projectEditMode = function(pin,id, projName, projDetails){
		$scope.id = id;
		projectName = projName;
		projectDetails = projDetails;
		InputVal = $scope.id;
		alert(id + " " + InputVal + " " + projectName + " " + projectDetails);
	};
	
	/*$scope.project = {};
	$scope.project.name = projectName;
	$scope.project.details = projectDetails;
	
	$scope.projectUpdateConfirmed = function(){
		$scope.project = {};
		$scope.project.name = projectName;
		$scope.project.details = projectDetails;
		alert($scope.project.name);
	};*/
	
	$scope.projectDeleteMode  = function(pin,id){
		$scope.id = id;
		DeleteVal = $scope.id;
		alert(id + " " + DeleteVal);
	};
	
	$scope.checkIfInput = function(rowId){
		var flag = false;
		if (rowId == InputVal){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfDelete = function(rowId){
		var flag = false;
		if (rowId == DeleteVal){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfUpdate = function(rowId){
		var flag = true;
		if (rowId == InputVal || rowId == DeleteVal){
			flag = false;
		}
		return flag;
	};
	
	$scope.resetInputFlag = function(){
		InputVal = 0;
	};
	
	$scope.resetDeleteFlag = function(){
		DeleteVal = 0;
	};
	
});

var update = project.controller('update', function($scope, $http){

	$scope.project = {
		updateName: projectName,
		updateDetails: projectDetails
	};
	
	$scope.projectUpdateConfirmed = function(){
	
		alert(projectName + " " + $scope.project.updateName);
		
		/*jsonData = {
			id : InputVal,
			projectNameJson : $scope.project.updateName,
			projectDetailsJson : $scope.project.updateDetails
		};
		
		$http.post("updateProject",jsonData)
			.success(function(data, status, headers, config){
				if(data.errorList.length == 0){
					alert("Entry updated successfully");
					location.reload(true);
				}
				else{
				
				}
			
			})
			.error(function(data, status, headers, config){
				alert("error " + status);
			});
		*/
	};
});

var addProject = project.controller('addProject', function($scope, $http){
	$scope.project = {};
	$scope.project.name = "";
	$scope.project.details = "";
	
	$scope.addNewProject = function(){
		alert($scope.project.name);
		
		jsonData = {
			projectNameJson : $scope.project.name,
			projectDetailsJson : $scope.project.details
		};
		
		$http.post("addProject",jsonData)
			.success(function(data, status, headers, config){
				if(data.errorList.length == 0){
					alert("Entry added successfully");
					location.reload(true);
				}
				else{
					
				}
			})
			.error(function(data, status, headers, config){
				alert("error " + status);
		});
		
	};
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
