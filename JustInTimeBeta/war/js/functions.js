/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */



$("#listButton").click(
		function() {
			$("#calendar").hide();
			$("#taskMList").show();
			$("#projectList").show();
			$(this).addClass("radical-simple-button-active");
			$("#calendarButton").addClass("radical-simple-button").removeClass(
					"radical-simple-button-active");
		});

$("#calendarButton").click(
		function() {
			$("#projectList").hide();
			$("#calendar").show();
			$(this).addClass("radical-simple-button-active");
			$("#listButton").addClass("radical-simple-button").removeClass(
					"radical-simple-button-active");
		});

function retrieveTaskMasterList(successMessage) {
	// alert("inside meth");
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
											formattedTaskList += ''
												+ '<div class = "row radical-pin-tasks">'
												+ '<div class = "radical-pin-tasks-name col-lg-3">'
												+ value.taskName
												+ '</div>'
												+ '<div class = "radical-pin-tasks-details col-lg-7">'
												+ value.taskDetails
												+ '</div>'
												+ '<div class = "radical-pin-tasks-name-edit col-lg-3">'
												+ '<input type="text" class="form-control" placeholder="" value="' + value.taskName + '">'
												+ '</div>'
												+ '<div class = "radical-pin-tasks-details-edit col-lg-7">'
												+ '<textarea class="form-control" rows="3">'
												+ value.taskDetails
												+ '</textarea>'
												+ '</div>'
												+ '<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">'
												+ '<button class="btn btn-sm text-right radical-task-btn-edit" onclick = "taskPinEditMode(this)">'
												+ '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'
												+ '</button>'
												+ '<button class="btn btn-sm text-right radical-tasks-btn-remove" onclick = "removeClicked(this,'+ value.id +')">'
												+ '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'
												+ '</button>'
												+ '<button class="btn btn-sm text-right radical-task-btn-save">'
												+ 'save'
												+ '</button>'
												+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel" onclick = "taskPinNormalMode(this)">'
												+ 'cancel'
												+ '</button>'
												+ '</div>'
												+ '</div>';
										});
						if (formattedTaskList == "") {
							formattedTaskList = "<div>No Tasks in the Master List!</div>";
						}
						//alert(formattedTaskList);
						$("#taskMList").html(formattedTaskList);
						tasksReady();
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
						$
								.each(
										data.projectList,
										function(index, value) {
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
													+ '<a href="/projectPage?projectName='// create
																									// a
																									// form?
													+ value.projectName
													+ '" class="button" style="font-weight: bold">'
													+ 'Go to project' + '</a>'
													+ '</div>' + '</div>';
										});
						if (formattedProjectList == "") {
							formattedProjectList = "<div>No Projects in the Master List!</div>";
						}
						// alert(formattedProjectList);
						$("#projectList").html(formattedProjectList);
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

function searchTask(taskName) {

	jsonData = {
		data : JSON.stringify({
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

											formattedTaskList += ''
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

						// alert(formattedTaskList);
						$("#TaskMList").html(formattedTaskList);
						// if (undefined != successMessage && "" !=
						// successMessage) {
						// alert(successMessage);
						// }
					} else {
						alert('Failed to retreive tasks masterlist!');
					}
				},
				error : function(jqXHR, status, error) {
					alert("error");
				}
			});
}


function taskPinEditMode(pin){
	
	pin = $(pin).parent().parent();
	
	$(pin).find(".radical-task-btn-edit").hide();
	$(pin).find(".radical-tasks-btn-remove").hide();
	$(pin).find(".radical-pin-tasks-name").hide("200","linear", function(){$(pin).find(".radical-pin-tasks-name-edit").show("400","linear");});
	$(pin).find(".radical-pin-tasks-details").hide("200","linear", 
			function(){
				$(pin).find(".radical-pin-tasks-details-edit").show("400","linear");
				$(pin).find(".radical-task-btn-save").show("400", "linear");
				$(pin).find(".radical-tasks-btn-cancel").show("400", "linear");
	});
	
	
}

function taskPinNormalMode(pin){
	
	pin = $(pin).parent().parent();
	
	$(pin).find(".radical-task-btn-save").hide();
	$(pin).find(".radical-tasks-btn-cancel").hide();
	$(pin).find(".radical-pin-tasks-name-edit").hide("200","linear", function(){$(pin).find(".radical-pin-tasks-name").show("400","linear");});
	$(pin).find(".radical-pin-tasks-details-edit").hide("200","linear", 
			function(){
				$(pin).find(".radical-pin-tasks-details").show("400","linear");
				$(pin).find(".radical-task-btn-edit").show("400", "linear");
				$(pin).find(".radical-tasks-btn-remove").show("400", "linear");
	});
	
	
}

function tasksReady(){
	$(".radical-pin-tasks-details-edit").hide();
	$(".radical-pin-tasks-name-edit").hide();
	$(".radical-task-btn-save").hide();
	$(".radical-tasks-btn-cancel").hide();
}


function removeClicked(btn , id){
	$("#confirmRemoveTask").modal("show");
	var taskName = $(btn).parent().parent().find(".radical-pin-tasks-name").html();
	$("#confirmRemoveTask").find(".removeTaskLabel").html(taskName);
	$("#confirmDeleteTask").val(id);
}

function deleteConfirmed(){
	var idValue = $("#confirmDeleteTask").val();
	
	jsonData = {
			data : JSON.stringify({
				id : idValue
			})
	};
	
	
	$.ajax({
		url : 'delete',
		type : 'POST',
		data : jsonData,
		dataType : 'json',
		success : function(data, status, jqXHR) {
			if (data.errorList.length == 0) {
				retrieveTaskMasterList("TaskMasterList");
			} else {
				alert('Failed to retreive tasks masterlist!');
			}
		},
		error : function(jqXHR, status, error) {
			alert("error");
		}
	});
	
	
}