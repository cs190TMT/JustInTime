<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!-- Modal -->
<div class="modal fade" id="addTaskModal" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add Task</h4>
			</div>
			<form method="post" action="/addMasterTask">
				<div class="modal-body">
					<dl class="dl-horizontal">
						<dt>Name:</dt>
						<dd>
							<input type="text" class="form-control" name="taskName" id="taskMasterName"/>
						</dd>
						<br />
						<dt>Details:</dt>
						<dd>
							<input type="text" class="form-control" name="taskDetails" id="taskMasterDetails"/>
						</dd>
					</dl>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="btnAddMasterTask" onclick="addMasterTask()">Add</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
