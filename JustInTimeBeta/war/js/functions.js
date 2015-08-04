/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

$(document).ready(function() {
	retrieveTaskList("TaskMasterList");
	retrieveProjectList("ProjectList");
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
													+ '</div>' + '</div>'
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
	$("#projList").empty();
	$
			.ajax({
				url : 'retrieveProjectList',
				type : 'GET',
				data : null,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedProjectList = "";
						$
								.each(
										data.taskList,
										function(index, value) {
											formattedProjectList += '<hr />'
													+ '<li class="sub-menu radical-submenu"><a href="/projectPage"'
													+ '	style="padding-left: 35px;"> <span'
													+ '		class="badge radical-badge radical-badge-project glyphicon glyphicon-file"'
													+ '		style="margin-right: 5px;"> </span> <span class="submenu-text">'
													+ value.projectName
													+ '</span>'
													+ '</a></li>'
										});
						if (formattedProjectList == "") {
							formattedProjectList = "<div>No Tasks in the Master List!</div>";
						}
							alert(formattedTaskList);
						$("#taskMList").html(formattedProjectList);
						if (undefined != successMessage && "" != successMessage) {
							 alert(successMessage);
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