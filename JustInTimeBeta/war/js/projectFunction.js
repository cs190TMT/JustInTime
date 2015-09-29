var project = angular.module('project',[]).controller('projectController', function($scope,$http){
	
	$scope.updateId;
	$scope.deletId;
	var canDelete = true;
	
	$scope.projName = "";
	$scope.projDetails = "";
	
	$http.get("retrieveProjectList")
	.success(function(data, status, header, config){
		if(data.errorList.length == 0){
			
			$scope.projectList = data.projectList;
			
		}
		else{
			
		}
		
	});
	
	/*$scope.projectUpdateConfirmed = function(project){
		
		$scope.projName = project.projectName;
		$scope.projDetails = project.projectDetails;
		name = $scope.projName;
		details = $scope.projDetails;
		
		alert($scope.projName + " " + $scope.projDetails + " " + name + " " + details);
			
		
		
	};*/
	
	$scope.projectUpdateConfirmed = function(idVal){
		
		var name = $("#projectName_"+ idVal).val();
		var details = $("#projectDetails_"+ idVal).val();
		
		alert(name + " " + details);
		
		jsonData = {
				id : idVal,
				projectNameJson : name,
				projectDetailsJson : details
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
		
	};
	
	$scope.projectEditMode = function(pin,id,name,details){
		$scope.id = id;
		$scope.updateId = id;
		$scope.projName = name;
		$scope.projDetails = details;
		alert(id + " " + $scope.updateId + " " + $scope.projName + " " + $scope.projDetails);
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
		
	$scope.addNewProject = function(){
		alert($scope.projName);
			
		jsonData = {
			projectNameJson : $scope.projName,
			projectDetailsJson : $scope.projDetails
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
