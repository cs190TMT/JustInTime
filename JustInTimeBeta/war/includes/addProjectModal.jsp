


<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!-- Modal -->
<div class="modal fade" id="addProjectModal" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content" ng-controller="projectController">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add Project</h4>
			</div>

			<!-- <form method="post" action="/addProject"> -->

				<div class="modal-body">
					<dl class="dl-horizontal">
						<dt>Name:</dt>
						<dd>

							<input ng-model="projName" type="text" class="form-control" name="projectName" id="projectName"/>{{projName}}

						</dd>
						<br />
						<dt>Details:</dt>
						<dd>
							<input ng-model="projDetails" type="text" class="form-control" name="projectDetails" id="projectDetails"/>{{projDetails}}

						</dd>
					</dl>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					<button type="button" class="btn btn-primary" id="btnAddProject" ng-click="addNewProject()">Add</button>
				</div>
			<!-- </form> -->

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
