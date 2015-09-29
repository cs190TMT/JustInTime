var project = angular.module('project',[]).controller('projectController', function($scope,$http){
	$scope.deleteProject = false;
	$scope.deleteCancelProject = false;
	$scope.editSaveProject = false;
	$scope.editCancelProject = false;
	$scope.editNameButton = false;
	$scope.editDetailsButton = false;
	$scope.deleteConfirm = false;
	$scope.editNameProject = true;
	$scope.editDetailsProject = true;
	
	$scope.updateId;
	$scope.deletId;
	var canDelete = true;
	var projectName;
	var projectDetails;
	
	
	
	$http.get("retrieveProjectList")
	.success(function(data, status, header, config){
		if(data.errorList.length == 0){
			
			$scope.projectList = data.projectList;
			
		}
		else{
			
		}
		
	});
	
	$scope.projectEditMode = function(pin,id, projName, projDetails){
		$scope.id = id;
		$scope.updateId = id;
		projectName = projName;
		projectDetails = projDetails;
		alert(id + " " + $scope.updateId + " " + projectName + " " + projectDetails);
	};
	
	$scope.projectDeleteMode  = function(pin,id){
		$scope.id = id;
		$scope.deletId = $scope.id;
		
		$http.get('retrieveTaskProjectList')
			.success(function(data, status, header, config){
				if(data.length > 0){
					canDelete = false;
					alert("success");
				}
				else{
					
				}
				
			});
				
		alert(id + " " + $scope.deletId);
	};
	
	$scope.checkIfInput = function(rowId){
		var flag = false;
		if (rowId == $scope.updateId){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfDeleteOk = function(rowId){
		var flag = false;
		if (rowId == $scope.deletId && canDelete){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfDelete = function(rowId){
		var flag = false;
		if (rowId == $scope.deletId){
			flag = true;
		}
		return flag;
	};
	
	$scope.checkIfUpdate = function(rowId){
		var flag = true;
		if (rowId == $scope.updateId || rowId == $scope.deletId){
			flag = false;
		}
		return flag;
	};
	
	$scope.resetInputFlag = function(){
		$scope.updateId = 0;
	};
	
	$scope.resetDeleteFlag = function(){
		$scope.deletId = 0;
	};
	
	$scope.project = {
			updateName: projectName,
			updateDetails: projectDetails
		};
		
		$scope.projectUpdateConfirmed = function(){
		
			alert(projectName + " " + $scope.project.updateName);
			
			/*jsonData = {
				id : $scope.updateId,
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
