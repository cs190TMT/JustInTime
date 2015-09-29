angular.module('logApp',[]).controller('logController', function($scope, $http){
	

	$http.get("retrieveLogs").success(function(data, status, header, config){
		if(data.errorList.length == 0){
			$scope.logList = data.logsList;
			
		}
		else{
			
		}
	});
	