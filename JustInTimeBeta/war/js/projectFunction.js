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
var canDelete = true;
var projectName;
var projectDetails;

var retrieve = project.controller('retrieve', function($scope, $http){
	
	$http.get("retrieveProjectList")
		.success(function(data, status, header, config){
			if(data.errorList.length == 0){
				$scope.projectList = data.projectList;
				
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
		
		$http.get('retrieveTaskProjectList')
			.success(function(data, status, header, config){
				if(data.length > 0){
					canDelete = false;
					alert("success");
				}
				else{
					
				}
				
			});
				
		alert(id + " " + DeleteVal);
	};
	
	$scope.checkIfInput = function(rowId){
		var flag = false;
		if (rowId == InputVal){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfDeleteOk = function(rowId){
		var flag = false;
		if (rowId == DeleteVal && canDelete){
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

var deleteProject = project.controller('deleteProject', function($scope, $http){
	
	$scope.projectDeleteConfirmed = function(pin,idVal){
		
		alert("Deleting "+  idVal);
		
		jsonData = {
			id: idVal
		};
		
		$http.post("deleteProject",jsonData)
			.success(function(data, status, header, config){
				if(data.errorList.length == 0){
					alert("Delete successfull.");
					location.reload(true);
				}
				else{
					
				}
			})
			.error(function(data, status, header, config){
				alert("error " + status);
			});
		
	};

});
