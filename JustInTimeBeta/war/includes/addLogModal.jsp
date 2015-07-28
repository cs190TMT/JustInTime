<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!-- Modal -->
<div class="modal fade" id="addLogModal" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add Log</h4>
			</div>
			<form method="post" action="/addLog">
				<div class="modal-body">
					<dl class="dl-horizontal">
						<dt>Date:</dt>
						<dd>
							<b> <%
 	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 %><%=df.format(new java.util.Date())%></b>
						</dd>
						<br />
						<dt>Task:</dt>
						<dd>
							<select name="taskName" class="form-control" id="taskName">

								<option value="Task 1">Task 1</option>
								<option value="Task 2">Task 2</option>
							</select>
						</dd>
						<br />
						<dt>Phase:</dt>
						<dd>
							<select name="taskPhase" class="form-control" id="taskPhase">

								<option value="Coding">Coding</option>
								<option value="Testing">Testing</option>
							</select>
						</dd>
						<br />
						<dt>Time Spent:</dt>
						<dd>
							<input type="text" class="form-control" name="timeSpent"
								id="timeSpent" />
						</dd>
					</dl>
					<input type="text" name="projectName" id="projectName"
						value="Default" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->