<!-- TODO:
		search bar layout: 
				no proper position to be placed
		task toggle not working:
				no layout
				no code
		added task:
				no layout
				no confirm/add , reset/clear, remove buttons
				
		add task to project :
				no codes yet
				not connected to DAO
					
	 -->
	<!-- Modal -->
	<div class="modal fade" id="pullTasksModal" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Pull Tasks</h4>
				</div>
				<div class="modal-body">
				    <div style="margin-top: 10px; max-height: 500px; overflow-y: scroll;">
				    	<div id="pullTaskMasterList"></div>	
					</div>
				</div>
				<div class="modal-footer"></div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- DO NOT REMOVE  -->
	<!-- DO NOT REMOVE  -->
	<!-- DO NOT REMOVE  -->
	<!-- 
	<div class="modal fade" id="pullTasksModal" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog-addTask">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Pull Tasks</h4>
					
				</div>
				<form method="post" action="/addMasterTask">
					<div class="modal-body">
					    <div style="margin-top: 10px; max-height: 500px; overflow-y: scroll;">
							<div class="col-lg-4 ">
								<h4>Added</h4>
								<div id="modalPullMasterTaskAddToAdded"></div>
								
									
									<div id="removeAdded" class ="col-lg-12 radical-list-pin">
										<button id="remove" type="button" class="radical-simple-button-removeTask " style="float: right; " aria-label="Left Align" ><span class=" glyph-icon glyphicon-remove-sign radical-font-planning" style="padding-left: 2px; padding-bottom: 3px; padding-right: 2px;"aria-hidden="true"></span> </button>
										<div class="pin-content ">
											<h4>Task Name</h4>
											<h5>Time : <input name="time" placeholder="hh:mm" required style="border: 0; border-bottom: 1px solid black;"/></h5>
											
											<br />
										</div>
									</div>
								
								
								
								
							</div>
							<div class="col-lg-8 modal-border-addTask">
									<h4>Master List</h4>
									
									
												<div id="modalPullMasterTask" class ="col-lg-12 radical-list-pin">
												<div class="pin-content radical-border-addTask">
												<div class ="col-lg-9">
												<h4>'+ value.taskName +'</h4>
												<h5>'+ value.taskDetails +'</h5>
												</div>
												<div class ="col-lg-3">
											    <form method="post" action="/addProjectTask">
												<input hidden name="taskName" value="'+ value.taskName +'"/>
												<input hidden name="taskDetails" value="'+ value.taskDetails +'"/>
												<input hidden name="projectName" value="Test"/>
												<input hidden name="projectName" value="Test"/>
												<div class="panel">
												<h4>
												<button type="button" id="btnAddProjectTask" class="radical-simple-button-addTask radical-font-planning" style="float: left; " aria-label="Left Align" ><span class=" glyph-icon glyphicon-plus-sign radical-font-planning" aria-hidden="true"></span> Planning </button>
												<button type="button" class="radical-simple-button-addTask radical-font-design  " style="float: left; " aria-label="Left Align" ><span class=" glyph-icon glyphicon-plus-sign radical-font-design" aria-hidden="true"></span> Design </button>
												<button type="button" class="radical-simple-button-addTask radical-font-coding  " style="float: left; " aria-label="Left Align" ><span class=" glyph-icon glyphicon-plus-sign radical-font-coding" aria-hidden="true"></span> Coding </button>
												</h4>
												</div>
											    </form>
												</div>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												</div>
												</div>
									
									
									<div id="pullTaskMasterList"></div>
							</div>
							
						</div>
					

					</div>
					<div class="modal-footer">
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
	
	 -->
	<!-- 
	Search bar unused  
		<form method="post" action="/addMasterTask">
			<div class="input-group" style="width:50%;">
				<input type="text" class="form-control" placeholder="Search for tasks" >
			    <span class="input-group-btn">
			    	<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
			    </span>
			</div>
		</form>
	-->

	<!--
	PULL BUTTON 
		<button type="button" class="pin-tools">
			<span class=" glyphicon glyphicon-arrow-down" ></span> pull
		</button> 
	-->
  	
  	<!-- 
	  	<div style="margin-top: 10px; max-height: 400px; overflow-y: scroll;">
			<div class ="col-lg-12 radical-list-pin">
				<span class="pin-phase radical-color-design">Design</span>
				<span class="pin-phase radical-color-planning">Planning</span>
				<span class="pin-phase radical-color-coding">Coding</span>
				<div class="pin-content radical-border-design">
					<h4>Task Name</h4>
					<h5>Task Details</h5>
					<br />
				</div>
			</div>
		</div>
	 -->