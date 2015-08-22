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
													+ '<div class="row listRow listRowProperty">'
														+ '<div class="col-md-4 listProperty">'
														+ value.taskName
														+ '</div>'
														+ '<div class="col-md-4 listProperty">'
														+ value.taskDetails
														+ '</div>'
													+ '</div>'
													+ '<div class="row listRow listRow	Edit listRowProperty">'
														+ '<di class="col-md-6 listEdit">'
															+ '<form>'
																+ '<div class="row">'
																+ '<div class="col-md-2">'
																+ 'Name'
																+ '</div>'
																+ '<div class="col-md-10">'
																+ '<input class="form-control" id="taskName" type="text" value="'
																+ value.taskName
																+ '"/>'
																+ '</div>'
																+ 'Detail'
																+ '<input class="form-control" id="taskDetail" type="text" value="'
																+ value.taskDetails
																+ '"/>'
																+ '</div>'
															+ '</form>'
															+ '</di>'
													+ '</div>';
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