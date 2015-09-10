		
	<!-- Modal -->
	<div class="modal fade" id="editTaskModal" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Task Info</h4>
				</div>
					<div class="modal-body">
						<center>
						<div class="btn-group" data-toggle="buttons" >
						  <label class="btn btn-primary active radical-no-radius-right" id="basicInfoOption">
						    <input type="radio" name="options"  autocomplete="off" checked>Basic info
						  </label>
						  <label class="btn btn-primary" id="taskLogsOption">
						    <input type="radio" name="options" autocomplete="off" > Logs
						  </label>
						</div>
					    </center>
						<br />
						
						    <div role="tabpanel" class="tab-pane active" id="basicInfo" >
							
							  <div class="row" style="padding: 10px;">
								    <div class="row" style="margin-bottom: 10px;">
								    	<div class="col-lg-2">
								    		Name
								    	</div>
								    	<div class="col-lg-10">
								    		<input type="text" class="form-control" id="exampleInputName2" value="Task 1">
								    	</div>
								  	</div>
								  	<div class="row" style="margin-bottom: 10px;">
								    	<div class="col-lg-2">
								    		Due
								    	</div>
								    	<div class="col-lg-10">
								    		<input type="date" class="form-control" id="exampleInputName2" value="Task 1">
								    	</div>
								  	</div>
								  	<div class="row" style="margin-bottom: 10px;">
								    	<div class="col-lg-2 ">
								    		Details
								    	</div>
								    	<div class="col-lg-10">
								    		<textarea class="form-control" rows="5">This task requires knowledge of the ...</textarea>
								    
								  		</div>
								  	</div>
								
							</div>
								
						    
						    </div>
						    <div role="tabpanel" class="tab-pane" id="taskLogs">
							    <div style="max-height:300px; overflow-y: scroll;">
							    	<table class="table table-hover">
									  <tr>
									  	<td>Johnny Depp</td>
									  	<td>Project 1</td>
									  	<td>August 11, 2015</td>
									  	<td> 3 hrs</td>
									  </tr>
									  <tr>
									  	<td>Mark Anthony</td>
									  	<td>Project 1</td>
									  	<td>August 10, 2015</td>
									  	<td> 1.4 hrs</td>
									  </tr>
									  <tr>
									  	<td>Adolf Hitler</td>
									  	<td>Project 1</td>
									  	<td>August 9, 2015</td>
									  	<td> 5 hrs</td>
									  </tr>
									  <tr>
									  	<td>Miley Cyrus</td>
									  	<td>Project 1</td>
									  	<td>August 8, 2015</td>
									  	<td> 2 hrs</td>
									  </tr>
									  <tr>
									  	<td>John Green</td>
									  	<td>Project 1</td>
									  	<td>August 7, 2015</td>
									  	<td> 1 hr</td>
									  </tr>
									  <tr>
									  	<td>Jaques Valdez</td>
									  	<td>Project 1</td>
									  	<td>August 8, 2015</td>
									  	<td> 7 hrs</td>
									  </tr>
									  <tr>
									  	<td>Johnny Depp</td>
									  	<td>Project 1</td>
									  	<td>August 11, 2015</td>
									  	<td> 3 hrs</td>
									  </tr>
									  <tr>
									  	<td>Mark Anthony</td>
									  	<td>Project 1</td>
									  	<td>August 10, 2015</td>
									  	<td> 1.4 hrs</td>
									  </tr>
									  <tr>
									  	<td>Adolf Hitler</td>
									  	<td>Project 1</td>
									  	<td>August 9, 2015</td>
									  	<td> 5 hrs</td>
									  </tr>
									  <tr>
									  	<td>Miley Cyrus</td>
									  	<td>Project 1</td>
									  	<td>August 8, 2015</td>
									  	<td> 2 hrs</td>
									  </tr>
									  <tr>
									  	<td>John Green</td>
									  	<td>Project 1</td>
									  	<td>August 7, 2015</td>
									  	<td> 1 hr</td>
									  </tr>
									  <tr>
									  	<td>Jaques Valdez</td>
									  	<td>Project 1</td>
									  	<td>August 8, 2015</td>
									  	<td> 7 hrs</td>
									  </tr>
									</table>
							    </div>
						    </div>
						    
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save</button>
					</div>
					
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<script type="text/javascript">



$('#taskLogs').hide();
$('#basicInfo').show();

$("#basicInfoOption").click(function(){
    $('#taskLogs').hide();
    $('#basicInfo').show();
    
    $('#editTaskModal').find('.modal-footer').find('button').show();
    
});

$("#taskLogsOption").click(function(){
    $('#basicInfo').hide();
    $('#taskLogs').show();
    
    $('#editTaskModal').find('.modal-footer').find('button').hide();
});


</script>