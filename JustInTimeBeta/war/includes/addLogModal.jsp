<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!-- Modal -->
<div class="modal fade" id="addLogModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" contentEditable="true">UI
					Design for Homepage</h4>
			</div>
			<div class="modal-body">
				<b>
					<%
						java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					%>
					Date: <%=df.format(new java.util.Date())%></b>
				<form class="form-inline" action="">
					<div class="form-group">
						<label for="exampleInputName2"><b>Task</b></label> <select
							class="form-control">
							<option>Task 1: Design</option>
							<option>Task 1: Coding</option>
							<option>Task 2: Testing</option>
						</select>
					</div>
				</form>
				<br />
				<form class="form-inline" action="">
					<div class="form-group">
						<label for="exampleInputName2"><b>Time Spent: </b></label> <input
							type="text" id="taskTimeSpent" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!-- -end of modal -->