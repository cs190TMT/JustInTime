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

//Functions for Tasks start
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
						var formattedTaskList = ''
							+ '<div class="row listRow listRowHeader">'
							+ '<div class="col-md-4 listProperty listHeader">Name</div>'
							+ '<div class="col-md-4 listProperty listHeader">Details</div>'
							+ '</div>';
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
						// alert(formattedTaskList);
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
													+ '<div class="row listRow listRowProperty">'
													+ '<div class="col-md-4 listProperty">'
													+ value.taskName
													+ '</div>'
													+ '<div class="col-md-4 listProperty">'
													+ value.taskDetails
													+ '</div>'
													+ '</div>';

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
	
	

//Functions for Tasks end

//Functios for Projects start
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
													+ '" style="color: black">'
													+ '<div class="row listRow listRowProperty">'
													+ '<div class="col-md-4 listProperty">'
													+ value.projectName
													+ '</div>'
													+ '<div class="col-md-4 listProperty">'
													+ value.projectDetails
													+ '</div>'
													+ '</div>'
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
//Functios for Projects end

function setCalendar() {
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,basicWeek,basicDay'
		},
		defaultDate : '2015-02-12',
		editable : false,
		eventLimit : true, // allow "more" link when too many events
		events : [ {
			title : 'All Day Event',
			start : '2015-02-01'
		}, {
			title : 'Long Event',
			start : '2015-02-07',
			end : '2015-02-10'
		}, {
			id : 999,
			title : 'Repeating Event',
			start : '2015-02-09T16:00:00'
		}, {
			id : 999,
			title : 'Repeating Event',
			start : '2015-02-16T16:00:00'
		}, {
			title : 'Conference',
			start : '2015-02-11',
			end : '2015-02-13'
		}, {
			title : 'Meeting',
			start : '2015-02-12T10:30:00',
			end : '2015-02-12T12:30:00'
		}, {
			title : 'Lunch',
			start : '2015-02-12T12:00:00'
		}, {
			title : 'Meeting',
			start : '2015-02-12T14:30:00'
		}, {
			title : 'Happy Hour',
			start : '2015-02-12T17:30:00'
		}, {
			title : 'Dinner',
			start : '2015-02-12T20:00:00'
		}, {
			title : 'Birthday Party',
			start : '2015-02-13T07:00:00'
		}, {
			title : 'Click for Google',
			url : 'http://google.com/',
			start : '2015-02-28'
		} ]
	});

}