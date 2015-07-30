/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

$(document).ready(function() {
	alert("hello trish");
	retrieveTaskList("TaskMasterList");
});

function retrieveTaskList(successMessage) {
	$("#taskMasterList").empty();
	$.ajax({
		url: 'retrieveTaskMasterList',
		type: 'GET',
		data: null,
		success: function(data, status, jqXHR){
			if(data.errorList.length == 0) {
				var formattedTaskList = "";
				$.each(data.taskList, function(index, value) {
					formattedTaskList += '<hr />' +
						'<div class="masterTaskRow">' +value.taskName+ value.taskDetails+
						'	<input type="hidden" class="id" name="id" value="' + value.id + '"/>' +
						'	<input type="hidden" class="taskName" name="taskName" value="' + value.taskName + '"/>' +
						'	<input type="hidden" class="taskDetails" name="taskDetails" value="' + value.taskDetails + '"/>' +
						'	<div class="updateErrorDisplay"></div>' +
						'</div>';
				});
				if (formattedTaskList == "") {
					formattedTaskList = "<div>No Tasks in the Master List!</div>";
				}
				alert(formattedTaskList);
				$("#taskMList").html(formattedTaskList);
				if (undefined != successMessage && "" != successMessage) {
					alert(successMessage);
				}
			} else {
				alert('Failed to retreive tasks masterlist!');
			}
		},
		error: function(jqXHR, status, error) {
			alert("error");
		}
	});
}