		
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Add Task</h4>
				</div>
				<form method="post" action="/addMasterTask">
					<div class="modal-body">
						<dl class="dl-horizontal">
		          			<dt>Name:</dt><dd><input type="text" class="form-control" name="taskName"/></dd></br>
		            		<dt>Details:</dt><dd><input type="text" class="form-control" name="taskDetails"/></dd></br>
		            		<dt>Phase:</dt><dd><select name ="taskPhase" list="phase" class="form-control" id="taskPhase"></dd>
		  						<option value="Design">Design</option>
		  						<option value="Coding">Coding</option>
		  						<option value="Testing">Testing</option>
		  						</select>
							</dl>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
