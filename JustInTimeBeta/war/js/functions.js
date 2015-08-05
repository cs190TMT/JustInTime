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