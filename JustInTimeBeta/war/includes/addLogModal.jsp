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
				<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
				<%= df.format(new java.util.Date()) %>
				<form class="form-inline" action="">
					<div class="form-group">
						<label for="exampleInputName2"><b>Type</b></label> <select
							class="form-control">
							<option>Design</option>
							<option>Coding</option>
							<option>Testing</option>
						</select>
					</div>
				</form>
				<br />
				<form class="form-inline" action="">
					<div class="form-group">
						<label for="exampleInputName2"><b>Days Allocated</b></label>
					</div>
				</form>
				<form class="form-inline" style="padding-left: 20px" action="">
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
				<form class="form-inline"
					style="padding-left: 20px; padding-top: 10px;" action="">
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
					<div class="form-group" style="padding-left: 5px">
						<select class="form-control">
							<option>AM</option>
							<option>PM</option>
						</select>
					</div>
				</form>

				<form class="form-inline"
					style="padding-left: 20px; padding-top: 10px;" action="">
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
					<div class="form-group" style="padding-left: 5px">
						<select class="form-control">
							<option>AM</option>
							<option>PM</option>
						</select>
					</div>
				</form>
				<form class="form-inline"
					style="padding-left: 20px; padding-top: 10px;" action="">
					<div class="form-group">
						<button class="btn btn-default btn-sm" type="submit">add
							date</button>
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