			<aside >
          <div id="sidebar"  class="nav-collapse radical-sidebar">
              <!-- sidebar menu start--> 
              <ul class="sidebar-menu radical-sidebar-menu" id="nav-accordion">
              	  
                  <li>
                      <a href="/index" class="radical-active">
                          <i class="icon-tasks"></i>
                          <span class="radical-font-size">Tasks</span>
                          <button type="button" class="radical-add-button" data-toggle="modal" data-target="#myModal2">
                          		<span class="glyphicon glyphicon glyphicon-plus-sign" aria-hidden="true"><text>add</text></span>
                          </button>
                      </a>
                  </li>
                  
                  <!-- [News Tasks, Due Tasks, Overdue Tasks] -->
                  <li class="sub-menu radical-submenu">
                      <a href="/index" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-color-success" style="margin-right: 5px;">10</span>
                          <span class = "submenu-text"> New Tasks</span>
                      </a>
                  </li>
                  <li class="sub-menu radical-submenu">
                      <a href="/index" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-color-warning" style="margin-right: 5px;">4</span>
                          <span class = "submenu-text"> Due Today</span>
                      </a>
                  </li>
                  <li class="sub-menu radical-submenu">
                      <a href="/index" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-color-danger" style="margin-right: 5px;">4</span>
                          <span class = "submenu-text"> Overdue</span>
                      </a>
                  </li>
                  <!--  [END: News Tasks, Due Tasks, Overdue Tasks] -->

                  <li></li>
                  
                  <li class="sub-menu">
                      <a href="/projectPage"  class="radical-active">
                          <i class="icon-folder-close"></i>
                          <span class="radical-font-size">Projects</span>
                          <button type="button" class="radical-add-button">
                          		<span class="glyphicon glyphicon glyphicon-plus-sign" aria-hidden="true"><text>add</text></span>
                          </button>
                      </a>
                  </li>
                  
                  <!--  [Project List] -->
                  <li class="sub-menu radical-submenu">
                      <a href="/projectPage" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-badge-project glyphicon glyphicon-file" style="margin-right: 5px;"> </span>
                          <span class = "submenu-text"> Project 1</span>
                      </a>
                  </li>
                  <li class="sub-menu radical-submenu">
                      <a href="/projectPage" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-badge-project glyphicon glyphicon-file" style="margin-right: 5px;"> </span>
                          <span class = "submenu-text"> Project 2</span>
                      </a>
                  </li>
                  <li class="sub-menu radical-submenu">
                      <a href="/projectPage" style="padding-left: 35px;">
                          <span class = "badge radical-badge radical-badge-project glyphicon glyphicon-file" style="margin-right: 5px;"> </span>
                          <span class = "submenu-text"> Project 3</span>
                      </a>
                  </li>
                  
                  <!--  [END: Project List] -->
                 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
		
		
		
		<!-- Modal -->
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel" >Create A Task</h4>
				      </div>
				      <div class="modal-body">
				      <form class="form-inline">
							 <div class="form-group">
							    <label for="exampleInputName2"><b>Name</b></label>
							    <input type="text" class="form-control">
							  </div>
							</form>
				        	<form class="form-inline">
							  <div class="form-group">
							    <label for="exampleInputName2"><b>Type</b></label>
							    <select class="form-control">
							    	<option>Design</option>
							    	<option>Coding</option>
							    	<option>Testing</option>
							    </select>
							  </div>
							</form>
							<br/>
							<form class="form-inline">
							  <div class="form-group">
							    <label for="exampleInputName2"><b>Days Allocated</b></label>
							   </div>
							</form>
							<form class="form-inline" style="padding-left:20px">
							<div class="form-group">
							    <label for="exampleInputName2">Date </label>
							   </div>
							<div class="form-group">
							<select class="form-control">
							    	<option>January</option>
							    	<option>February</option>
							    	<option>April</option>
							    	<option>May</option>
							    	<option>June</option>
							    	<option>July</option>
							    	<option>August</option>
							    	<option>September</option>
							    	<option>October</option>
							    	<option>November</option>
							    	<option>December</option>
							    </select>
							</div>
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 1; i <= 30; i++){
							    	%>
							    	<option><%=i %></option>
							    	
							    	<%} %>
							    </select>
							</div>
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 2015; i <= 2020; i++){
							    	%>
							    	<option><%=i %></option>
							    	
							    	<%} %>
							    </select>
							</div>
							</form>
							<form class="form-inline" style="padding-left:20px; padding-top:10px;">
							<div class="form-group">
							    <label for="exampleInputName2">Start Time </label>
							   </div>
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 1; i <= 12; i++){
							    	%>
							    	<option><%=i %></option>
							    	
							    	<%} %>
							    </select>
							</div>
							 :
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 0; i <= 5; i++){
							    	%>
							    	<% for(int j = 0; j < 10; j++) {%>
							    	<option><%=i%><%=j %>
							    	<%} %>
							    	
							    	</option>
							    	
							    	<%} %>
							    </select>
							</div>
							<div class="form-group" style = "padding-left: 5px">
								<select class="form-control" >
									<option>AM</option>
									<option>PM</option>
							    </select>
							</div>
							</form>
							
							<form class="form-inline" style="padding-left:20px; padding-top:10px;">
							<div class="form-group">
							    <label for="exampleInputName2">End Time &nbsp;</label>
							   </div>
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 1; i <= 12; i++){
							    	%>
							    	<option><%=i %></option>
							    	
							    	<%} %>
							    </select>
							</div>
							 :
							<div class="form-group">
								<select class="form-control">
							    	<%
							    		for(int i = 0; i <= 5; i++){
							    	%>
							    	<% for(int j = 0; j < 10; j++) {%>
							    	<option><%=i%><%=j %>
							    	<%} %>
							    	
							    	</option>
							    	
							    	<%} %>
							    </select>
							</div>
							<div class="form-group" style = "padding-left: 5px">
								<select class="form-control" >
									<option>AM</option>
									<option>PM</option>
							    </select>
							</div>
							</form>
							<form class="form-inline" style="padding-left:20px; padding-top:10px;">
							<div class="form-group"> <button class="btn btn-default btn-sm" type="submit">add date</button>
							</div>
							</form>
							
							<form class="form-inline" style="padding-top:15px">
							  <div class="form-group">
							    <label for="exampleInputName2"><b>Details</b></label>
							   </div>
							</form>
							<form class="form-inline" >
							   <textarea class="form-control" rows="3"></textarea>
							</form>
							
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-primary">Create Task</button>
				      </div>
				    </div>
				  </div>
				</div>
				
		<!-- -end of modal -->

<script>


</script>