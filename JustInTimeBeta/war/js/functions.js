/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

$(document).ready(function() {
	retrieveTaskList("TaskMasterList");
});

function retrieveTaskList(successMessage) {
	$("#taskMList").empty();
	$
			.ajax({
				url : 'retrieveTaskMasterList',
				type : 'GET',
				data : null,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedTaskList = "";
						$
								.each(
										data.taskList,
										function(index, value) {
											formattedTaskList += '<hr />'
													+ '<div class="masterTaskRow">'
													+ value.taskName
													+ value.taskDetails
													+ '	<input type="hidden" class="id" name="id" value="'
													+ value.id
													+ '"/>'
													+ '	<input type="hidden" class="taskName" name="taskName" value="'
													+ value.taskName
													+ '"/>'
													+ '	<input type="hidden" class="taskDetails" name="taskDetails" value="'
													+ value.taskDetails
													+ '"/>'
													+ '	<div class="updateErrorDisplay"></div>'
													+ '</div>';
										});
						if (formattedTaskList == "") {
							formattedTaskList = "<div>No Tasks in the Master List!</div>";
						}
						//alert(formattedTaskList);
						$("#taskMList").html(formattedTaskList);
						if (undefined != successMessage && "" != successMessage) {
							//alert(successMessage);
						}
					} else {
						alert('Failed to retreive tasks masterlist!');
					}
				},
				error : function(jqXHR, status, error) {
					alert("error");
				}
			});
}

function searchTask(taskName) {

	jsonData = {
			data:JSON.stringify({
				taskName : taskName,
			})
	}; 
	
	$("#TaskMList").empty();
	$
			.ajax({
				url : 'search',
				type : 'GET',
				data : jsonData,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedTaskList = "";
						$
								.each(
										data.taskList,
										function(index, value) {
										
											formattedTaskList += '<div class="col-lg-12 radical-list-pin">'
															    + '<span class="pin-phase radical-color-coding"></span>'
															    + '<button type="button" class="pin-tools" style="font-weight: bold" data-toggle="modal" data-target="#editTaskModal">'
															    + '<span class=""></span> ...'
															    + '</button>'
															    + '<div class="pin-content radical-border-coding">'
															    + '<h4>'+ value.taskName  +'</h4>'
															    + '<span class="pin-info"><b>Started &nbsp;</b> July 20, 2015 <br /></span> <span class="pin-info"><b>Due'
															    + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> July 21, 2015 <br /></span>'
															    + '<span class="pin-info"><b>Time'
															    + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> 9:00 AM - 12:00 PM <br /></span><br />'
															    + '<span class="pin-info"><b>Found in </b> <br /> <a href=""'
															    + 'style="padding-left: 10px;"> Project 1</a>, <a href=""> Project'
															    + '2</a> <br /></span> <br />'
															    + '</div>'
															    + '</div>';
															    
												
											
											
										});
					
						//alert(formattedTaskList);
						$("#TaskMList").html(formattedTaskList);
						//if (undefined != successMessage && "" != successMessage) {
							//alert(successMessage);
						//}
					} else {
						alert('Failed to retreive tasks masterlist!');
					}
				},
				error : function(jqXHR, status, error) {
					alert("error");
				}
			});
}