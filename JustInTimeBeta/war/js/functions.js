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

// Functions for Tasks start
function addMasterTask() {
   if(validateMasterTask()){
		jsonData = {
			data : JSON.stringify({
				taskName : $('#taskMasterName').val(),
				taskDetails : $('#taskMasterDetails').val()
			})
		};
	
		$.ajax({
			url : 'addMasterTask',
			type : 'POST',
			data : jsonData,
			dataType : 'json',
			success : function(data, status, jqXHR) {
				if (data.errorList.length == 0) {
					$('#taskMasterName').val("");
					$('#taskMasterDetails').val("");
					$('#addMasterTaskModal').modal("hide");
					// alert("no error here");
					retrieveTaskMasterList('Entry saved successfully!');
					// alert("dk sandimas");
				} else {
					var msg = "";
					for (var i = 0; i < data.errorList.length; i++)
						msg += data.errorList[i] + "\n";
					$('#errorDisplay').html(msg);
				}
	
			},
			error : function(data, status, jqXHR) {
	
			}
		});
   }
}

function addProjectTask(phase, taskId) {
	jsonData = {
		data : JSON.stringify({
			taskName : $('#taskName_' + taskId).val(),
			taskDetails : $('#taskDetails_' + taskId).val(),
			timeAlloted : $('#taskAllotTime_' + taskId).val(),
			taskPhase : phase,
			taskProjId : getUrlParameter("id"),
			taskProjName : getUrlParameter("projectName")
		})
	};

	alert($('#taskName_' + taskId).val() + "\n"
			+ $('#taskDetails_' + taskId).val() + "\n"
			+ $('#taskAllotTime_' + taskId).val() + "\n" + phase + "\n"
			+ getUrlParameter("id") + "\n" + getUrlParameter("projectName"));

	$.ajax({
		url : 'addProjectTask',
		type : 'POST',
		data : jsonData,
		dataType : 'json',
		success : function(data, status, jqXHR) {
			alert("adf");
			if (data.errorList.length == 0) {
				$('#taskMasterName').val("");
				$('#taskMasterDetails').val("");
				$('#pullTasksModal').modal("hide");
				alert("no error here");
				retrieveTaskProjectList('Entry saved successfully!');
				// alert("dk sandimas");
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$('#errorDisplay').html(msg);
			}

		},
		error : function(data, status, jqXHR) {
			alert("error");
		}
	});
}

function planBtn(taskId) {
	// alert("Planning");
	addProjectTask("Planning", taskId);
}

function designBtn(taskId) {
	// alert("Design");
	addProjectTask("Design", taskId)
}

function codingBtn(taskId) {
	// alert("Coding");
	addProjectTask("Coding", taskId)
}

function retrievePullTaskMasterList(successMessage) {
	var ID = 0;
	var panel = 'panel';
	$("#pullTaskMasterList").empty();
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
											formattedTaskList += '<div id="modalPullMasterTask" class="col-lg-12 radical-list-pin">'
													+ '<div class="row pin-content radical-border-addTask">'
													+ '<input type="hidden" class="id" id="taskId_'
													+ value.id
													+ '" name="id" value="'
													+ value.id
													+ '"/>'
													+ ''
													+ '<div class ="col-lg-9">'
													+ '<input style="border:none; background-color:#ffffff" disabled name="taskName" id="taskName_'
													+ value.id
													+ '" value="'
													+ value.taskName
													+ '"/>'
													+ '<input style="border:none; background-color:#ffffff" disabled name="taskDetails" id="taskDetails_'
													+ value.id
													+ '" value="'
													+ value.taskDetails
													+ '"/>'
													+ '<br>Alloted time <input required type="number" step=".5" name="taskAllotTime" id="taskAllotTime_'
													+ value.id
													+ '">'
													+ '</div>'
													+ '<div class ="col-lg-3">'
													+ '<div class="panel">'
													+ '<button type="button" onclick="planBtn('
													+ value.id
													+ ')" class="radical-simple-button-addTask radical-font-planning" style="float: left" aria-label="Left Align">'
													+ '<span class="glyph-icon glyphicon-plus-sign radical-font-planning" aria-hidden="true">'
													+ '</span> Planning '
													+ '</button>'
													+ '<button type="button" onclick="designBtn('
													+ value.id
													+ ')" class="radical-simple-button-addTask radical-font-design" style="float: left; " aria-label="Left Align" >'
													+ '<span class="glyph-icon glyphicon-plus-sign radical-font-design" aria-hidden="true">'
													+ '</span> Design '
													+ '</button>'
													+ '<button type="button" onclick="codingBtn('
													+ value.id
													+ ')" class="radical-simple-button-addTask radical-font-coding" style="float: left; " aria-label="Left Align" >'
													+ '<span class="glyph-icon glyphicon-plus-sign radical-font-coding" aria-hidden="true">'
													+ '</span> Coding '
													+ '</button>'
													+ '</div>'
													+ '</div>'
													+ '<br>'
													+ '<br>'
													+ '</div>'
													+ '</div>';
										});
						if (formattedTaskList == "") {
							formattedTaskList = "<div>No Tasks in the Master List!</div>";
						}
						// alert(formattedTaskList);
						$("#pullTaskMasterList").html(formattedTaskList);
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

function retrieveTaskMasterList(successMessage) {
	$("#taskMList").empty();
	$
			.ajax({
				url : 'retrieveTaskMasterList',
				type : 'GET',
				data : null,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedTaskList = '';
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
													+ '<input type="text" data-placement="left" class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" onfocus = "taskEditChange(this,'
													+ value.id
													+ ')" placeholder="" value="'
													+ value.taskName
													+ '">'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-details-edit col-lg-7 input-group">'
													+ '<textarea class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" rows="3">'
													+ value.taskDetails
													+ '</textarea>'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-remove col-lg-10">'
													+ 'Are you sure you want to delete the task '
													+ '<b><span class="removeTaskLabel">'
													+ value.taskName
													+ '</span></b>?'
													+ '<div class="alert alert-warning col-lg-6" role="alert" style="margin-top: 10px; padding:10px;">'
													+ 'This task will also be removed in projects'
													+ '</div>'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">'
													+ '<button class="btn btn-sm text-right radical-task-btn-edit" onclick = "taskPinEditMode(this)">'
													+ '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove" onclick = "removeClicked(this)">'
													+ '<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove-confirm" onclick = "deleteConfirmed(this,'
													+ value.id
													+ ')">'
													+ 'delete'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-task-btn-save" onclick = "updateConfirmed(this, '
													+ value.id
													+ ')">'
													+ 'save'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel" onclick = "taskPinNormalMode(this)">'
													+ 'cancel'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel-2" onclick = "taskPinNormalMode2(this)">'
													+ 'cancel'
													+ '</button>'
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

					tasksReady();
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

	$("#taskMList").empty();
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
													+ '<div class = "row radical-pin-tasks">'
													+ '<div class = "radical-pin-tasks-name col-lg-3">'
													+ value.taskName
													+ '</div>'
													+ '<div class = "radical-pin-tasks-details col-lg-7">'
													+ value.taskDetails
													+ '</div>'
													+ '<div class = "radical-pin-tasks-name-edit col-lg-3">'
													+ '<input type="text" data-placement="left" class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" onfocus = "taskEditChange(this,'
													+ value.id
													+ ')" placeholder="" value="'
													+ value.taskName
													+ '">'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-details-edit col-lg-7 input-group">'
													+ '<textarea class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" rows="3">'
													+ value.taskDetails
													+ '</textarea>'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-remove col-lg-10">'
													+ 'Are you sure you want to delete the task <b><span class="removeTaskLabel">'
													+ value.taskName
													+ '</span></b>?'
													+ '<div class="alert alert-warning col-lg-6" role="alert" style="margin-top: 10px; padding:10px;"> This task will also be removed in projects</div>'
													+ '</div>'

													+ '<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">'
													+ '<button class="btn btn-sm text-right radical-task-btn-edit" onclick = "taskPinEditMode(this)">'
													+ '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'
													+ '</button>'

													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove" onclick = "removeClicked(this)">'
													+ '<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>'
													+ '</button>'

													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove-confirm" onclick = "deleteConfirmed(this,'
													+ value.id
													+ ')">'
													+ 'delete'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-task-btn-save" onclick = "updateConfirmed(this, '
													+ value.id
													+ ')">'
													+ 'save'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel" onclick = "taskPinNormalMode(this)">'
													+ 'cancel'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel-2" onclick = "taskPinNormalMode2(this)">'
													+ 'cancel'
													+ '</button>'
													+ '</div>' + '</div>';

										});

						// alert(formattedTaskList);
						$("#taskMList").html(formattedTaskList);
						// if (undefined != successMessage && "" !=
						// successMessage) {
						// alert(successMessage);
						// }
					} else {
						alert('Failed to retreive tasks masterlist!');
					}

					tasksReady();
				},
				error : function(jqXHR, status, error) {
					alert("error");
				}
			});
}

function validateMasterTask(){
	var taskName = $("#taskMasterName").val();
	taskName = taskName.trim();
	
	var ret = false;
	
	if(taskName != ""){
		ret = true;
		var bool = false;
		
		jsonData = {
				data : JSON.stringify({
					taskName : taskName,
				})
		};
		
		$
		.ajax({
			url : 'validTaskName',
			type : 'GET',
			data : jsonData,
			success : function(data, status, jqXHR) {
				if (data.errorList.length == 0 ) {
					
					if(data.validate <= 0){
						$("#btnAddMasterTask").removeClass("radical-btn-disabled");
						$("#btnAddMasterTask").removeAttr("disabled");
						
						$("#taskMasterName").removeClass("has-error");
						$("#taskMasterName").removeClass("radical-input-has-error");
						$("#taskMasterName").attr("data-placement", "right");
						$("#taskMasterName").attr("data-content","");
						$("#taskMasterName").popover("hide");
					}
					else{
						$("#btnAddMasterTask").addClass("radical-btn-disabled");
						$("#btnAddMasterTask").attr("disabled", "disabled");
						
						$("#taskMasterName").addClass("has-error");
						$("#taskMasterName").addClass("radical-input-has-error");
						$("#taskMasterName").attr("data-placement", "right");
						$("#taskMasterName").attr("data-content","name already exists");
						$("#taskMasterName").popover("show");
					}
					
				} else {
					alert('Failed to retreive tasks masterlist!');
					$("#btnAddMasterTask").addClass("radical-btn-disabled");
					$("#btnAddMasterTask").attr("disabled", "disabled");
				}

				tasksReady();
			},
			error : function(jqXHR, status, error) {
				alert("error");
				$("#btnAddMasterTask").addClass("radical-btn-disabled");
				$("#btnAddMasterTask").attr("disabled", "disabled");
			}
		});
		
	}
	else{
		$("#btnAddMasterTask").addClass("radical-btn-disabled");
		$("#btnAddMasterTask").attr("disabled", "disabled");
		
		$("#taskMasterName").addClass("has-error");
		$("#taskMasterName").addClass("radical-input-has-error");
		$("#taskMasterName").attr("data-placement", "right");
		$("#taskMasterName").attr("data-content","name is required");
		$("#taskMasterName").popover("show");
	}
	
	return ret;
}

function taskEditChange(pin, idVal) {
	$(pin).find(".radical-task-btn-save").removeClass(
	"radical-task-btn-save-disabled");
	$(pin).find(".radical-task-btn-save").removeAttr(
		"disabled");
	$(pin).find(".radical-pin-tasks-name-edit")
		.removeClass("has-error");
	
	$(pin).find(".radical-pin-tasks-name-edit").attr(
		"data-placement", "left");
	$(pin).find(".radical-pin-tasks-name-edit").attr(
		"data-content", "");
	$(pin).find(".radical-pin-tasks-name-edit").popover(
		"hide");

}

function taskPinEditMode(pin) {

	pin = $(pin).parent().parent();

	$(pin).find(".radical-pin-tasks-details-edit").find("textarea").val(
			$(pin).find(".radical-pin-tasks-details").html());

	$(pin).find(".radical-task-btn-save").removeAttr("disabled");
	$(pin).find(".radical-pin-tasks-name-edit").removeClass("has-error");

	$(pin).find(".radical-task-btn-edit").fadeOut();
	$(pin).find(".radical-tasks-btn-remove").fadeOut();
	
	$(pin).find(".radical-pin-tasks-details").fadeOut(function() {

		$(pin).find(".radical-pin-tasks-details-edit").fadeIn();
		$(pin).find(".radical-task-btn-save").fadeIn();
		$(pin).find(".radical-tasks-btn-cancel").fadeIn();

	});

}

function taskPinNormalMode(pin) {

	pin = $(pin).parent().parent();

	$(pin).find(".radical-pin-tasks-name-edit").attr("data-content", "");
	$(pin).find(".radical-pin-tasks-name-edit").popover("hide");
	$(pin).find(".radical-task-btn-save").fadeOut();
	$(pin).find(".radical-tasks-btn-cancel").fadeOut();
    /*
	$(pin).find(".radical-pin-tasks-name-edit").fadeOut(function() {
		$(pin).find(".radical-pin-tasks-name").fadeIn();
	});*/
	$(pin).find(".radical-pin-tasks-details-edit").fadeOut(function() {
		$(pin).find(".radical-pin-tasks-details").fadeIn();
		$(pin).find(".radical-task-btn-edit").fadeIn();
		$(pin).find(".radical-tasks-btn-remove").fadeIn();
	});

}

function taskPinNormalMode2(pin) {
	pin = $(pin).parent().parent()

	$(pin).find(".radical-pin-tasks-remove").fadeOut();
	$(pin).find(".radical-tasks-btn-remove-confirm").fadeOut();
	$(pin).find(".radical-tasks-btn-cancel-2").fadeOut(function() {
		$(pin).find(".radical-pin-tasks-name").fadeIn();
		$(pin).find(".radical-pin-tasks-details").fadeIn();
		$(pin).find(".radical-task-btn-edit").fadeIn();
		$(pin).find(".radical-tasks-btn-remove").fadeIn(function() {
			$(pin).removeClass("radical-pin-tasks-removed", "200");
		});

	});
}

function tasksReady() {
	$(".radical-pin-tasks-details-edit").hide();
	$(".radical-pin-tasks-name-edit").hide();
	$(".radical-task-btn-save").hide();
	$(".radical-tasks-btn-cancel").hide();
	$(".radical-tasks-btn-remove-confirm").hide();
	$(".radical-tasks-btn-cancel-2").hide();
	$(".radical-pin-tasks-remove").hide();
	
	
}

function removeClicked(pin) {
	pin = $(pin).parent().parent();

	$(pin).addClass("radical-pin-tasks-removed", "200");

	$(pin).find(".radical-pin-tasks-name").fadeOut();
	$(pin).find(".radical-pin-tasks-details").fadeOut();
	$(pin).find(".radical-task-btn-edit").fadeOut();
	$(pin).find(".radical-tasks-btn-remove").fadeOut(function() {

		$(pin).find(".radical-pin-tasks-remove").fadeIn();
		$(pin).find(".radical-tasks-btn-remove-confirm").fadeIn();
		$(pin).find(".radical-tasks-btn-cancel-2").fadeIn();
	});

}

function deleteConfirmed(pin, idValue) {
	pin = $(pin).parent().parent();

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
				$(pin).hide("200", "linear")
				// retrieveTaskMasterList("TaskMasterList");
			} else {
				alert('Failed to retreive tasks masterlist!');
			}
		},
		error : function(jqXHR, status, error) {
			alert("error");
		}
	});

}

function updateConfirmed(btn, idVal) {
	var name = $(btn).parent().parent().find(".radical-pin-tasks-name-edit")
			.find("input").val();
	var details = $(btn).parent().parent().find(
			".radical-pin-tasks-details-edit").find("textarea").val();

	jsonData = {
		data : JSON.stringify({
			id : idVal,
			taskName : name,
			taskDetails : details
		})
	};

	$.ajax({
		url : 'update',
		type : 'POST',
		data : jsonData,
		dataType : 'json',
		success : function(data, status, jqXHR) {
			if (data.errorList.length == 0) {
				$(btn).parent().parent().find(".radical-pin-tasks-name").html(
						name);
				$(btn).parent().parent().find(".radical-pin-tasks-details")
						.html(details);
				taskPinNormalMode(btn);
				// retrieveTaskMasterList("TaskMasterList");
			} else {
				alert('Failed to retreive tasks masterlist!');
			}
		},
		error : function(jqXHR, status, error) {
			alert("error");
		}
	});
}

// Functions for Tasks end

// Functios for Projects start
function addProject() {
	jsonData = {
		data : JSON.stringify({
			projectName : $('#projectName').val(),
			projectDetails : $('#projectDetails').val()
		})
	};

	$.ajax({
		url : 'addProject',
		type : 'POST',
		data : jsonData,
		dataType : 'json',
		success : function(data, status, jqXHR) {
			if (data.errorList.length == 0) {
				$('#projectName').val("");
				$('#projectDetails').val("");
				$('#addProjectModal').modal("hide");
				// alert("no error here");
				retrieveProjectList('Entry saved successfully!');
				// alert("dk sandimas");
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$('#errorDisplay').html(msg);
			}

		},
		error : function(data, status, jqXHR) {

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
						var formattedProjectList = ''
								+ '<div class="row listRow listRowHeader">'
								+ '<div class="col-md-4 listProperty listHeader">Name</div>'
								+ '<div class="col-md-4 listProperty listHeader">Details</div>'
								+ '</div>';
						$
								.each(
										data.projectList,
										function(index, value) {
											formattedProjectList += ''
													+ '<a href="/projectPage?projectName='// create
													// a
													// form?
													+ value.projectName
													+ '&'
													+ 'id='
													+ value.id
													+ '" style="color: black">'
													+ '<div class="row listRow listRowProperty">'
													+ '<div class="col-md-4 listProperty">'
													+ value.projectName
													+ '</div>'
													+ '<div class="col-md-4 listProperty">'
													+ value.projectDetails
													+ '</div>' + '</div>'
													+ '</a>';
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

// Functios for Projects end

function setCalendar2() {
	$.ajax({
		url : 'RetrieveTasksForCalendar',
		type : 'GET',
		data : null,
		success : function(data, status, jqXHR) {
			console.log("data", data);
			$('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,basicWeek,basicDay'
				},
				defaultDate : '2015-0-12',
				editable : false,
				displayEventTime : false,
				eventLimit : true, // allow "more" link when too many events
				events : data.events
			})
		},
		error : function(jqXHR, status, error) {
			alert("Hello!");
		}
	});

}
function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL
			.split('&'), sParameterName, i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
}

function retrieveTaskProjectList(successMessage) {
	$("#taskMList").empty();
	jsonData = {
		data : JSON.stringify({
			projectName : getUrlParameter("projectName")
		})
	};

	$
			.ajax({
				url : 'retrieveTaskProjectList',
				type : 'GET',
				data : jsonData,
				success : function(data, status, jqXHR) {
					if (data.errorList.length == 0) {
						var formattedTaskList = '';
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
													+ '<input type="text" data-placement="left" class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" onfocus = "taskEditChange(this,'
													+ value.id
													+ ')" placeholder="" value="'
													+ value.taskName
													+ '">'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-details-edit col-lg-7 input-group">'
													+ '<textarea class="form-control" oninput = "taskEditChange(this,'
													+ value.id
													+ ')" rows="3">'
													+ value.taskDetails
													+ '</textarea>'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-remove col-lg-10">'
													+ 'Are you sure you want to delete the task'
													+ '<b><span class="removeTaskLabel">'
													+ value.taskName
													+ '</span></b>?'
													+ '<div class="alert alert-warning col-lg-6" role="alert" style="margin-top: 10px; padding:10px;">'
													+ 'This task will also be removed in projects'
													+ '</div>'
													+ '</div>'
													+ '<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">'
													+ '<button class="btn btn-sm text-right radical-task-btn-edit" onclick = "addLogModal('
													+ value.taskName
													+ ','
													+ value.taskPhase
													+ ')">'
													+ 'Edit'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove" onclick = "removeClicked(this)">'
													+ '<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-remove-confirm" onclick = "deleteConfirmed(this,'
													+ value.id
													+ ')">'
													+ 'delete'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-task-btn-save" onclick = "updateConfirmed(this, '
													+ value.id
													+ ')">'
													+ 'save'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel" onclick = "taskPinNormalMode(this)">'
													+ 'cancel'
													+ '</button>'
													+ '<button class="btn btn-sm text-right radical-tasks-btn-cancel-2" onclick = "taskPinNormalMode2(this)">'
													+ 'cancel'
													+ '</button>'
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

					tasksReady();
				},
				error : function(jqXHR, status, error) {
					alert("error");
				}
			});
}

function addLog() {

	jsonData = {
		data : JSON.stringify({
			projectName : getUrlParameter("projectName"),
			taskPhase : $('#xtaskPhase').val(),
			timeSpent : $('#timeSpent').val(),
			taskName : $('#xtaskName').val()
		})
	};

	$.ajax({
		url : 'addLog',
		type : 'POST',
		data : jsonData,
		dataType : 'json',
		success : function(data, status, jqXHR) {
			if (data.errorList.length == 0) {
				
				// alert("no error here");
				retrieveProjectList('Entry saved successfully!');
				// alert("dk sandimas");
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$('#errorDisplay').html(msg);
			}

		},
		error : function(data, status, jqXHR) {

		}
	});
}

function addLogModal(taskName, taskPhase) {
	
	$("#logsModal").modal("show");
	$("#xtaskName").val(taskName);
	$("#xtaskPhase").val(taskPhase);
}

