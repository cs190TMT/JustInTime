/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

$(document).ready(function() {
	retrieveTaskList("TaskMasterList");
});

$(document).ready(function() {
	//alert("rethere");
	retrieveProjectList("ProjectList");
});

function retrieveTaskList(successMessage) {
	//alert("inside meth");
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
													+ '<div class="col-lg-12 radical-list-pin">'
													+ '<span class="pin-phase radical-color-design">Master</span>'
													+ '<button type="button" class="pin-tools" style="font-weight: bold" data-toggle="modal"'
													+ '					data-target="#editTaskModal">'
													+ '	<span class=""></span> ...'
													+ '</button>'
													+ '<div class="pin-content radical-border-design">'
													+ '<span class="pin-info"><b>Task Name: &nbsp;</b>'
													+ value.taskName
													+ '<br /></span>'
													+ '<span class="pin-info"><b>Task Details: &nbsp;</b>'
													+ value.taskDetails
													+ '<br /></span>'
													+ '</div>' + '</div>';
										});
						if (formattedTaskList == "") {
							formattedTaskList = "<div>No Tasks in the Master List!</div>";
						}
						// alert(formattedTaskList);
						$("#taskMList").html(formattedTaskList);
						if (undefined != successMessage && "" != successMessage) {
							// alert(successMessage);
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

function retrieveProjectList(successMessage) {
	$("#projectList").empty();
	$
			.ajax({
				url : 'retrieveProjectList',
				type : 'GET',
				data : null,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedProjectList = "";
						$.each(data.projectList, function(index, value) {
											formattedProjectList += '<hr />'
												+ '<div class="col-lg-12 radical-list-pin">'
												+ '<span class="pin-phase radical-color-design">Project</span>'
												+ '<button type="button" class="pin-tools" style="font-weight: bold" data-toggle="modal"'
												+ '					data-target="#editTaskModal">'
												+ '	<span class=""></span> ...'
												+ '</button>'
												+ '<div class="pin-content radical-border-design">'
												+ '<span class="pin-info"><b>Project Name: &nbsp;</b>'
												+ value.projectName
												+ '<br /></span>'
												+ '<span class="pin-info"><b>Project Details: &nbsp;</b>'
												+ value.projectDetails
												+ '<br /></span>'
												+ '</div>' + '</div>';
										});
						if (formattedProjectList == "") {
							formattedProjectList = "<div>No Projects in the Master List!</div>";
						}
							//alert(formattedProjectList);
						$("#projectList").html(formattedProjectList);
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