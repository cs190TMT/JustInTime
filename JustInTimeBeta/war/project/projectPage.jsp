<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<%@ page contentType="text/html;charset=UTF8" language="java" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>JIThub</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet" />
    <link href="../css/radical.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <script src="../js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <%@include file="../includes/header.jsp" %>
      <!--header end-->
      <!--sidebar start-->
      <%@include file="../includes/sidebar.jsp" %>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="col-lg-9">
						<div class="row">
							<h3 style="float: left; padding: 0px; margin: 0px;">Project 1</h3>
							<button type="button" class="radical-simple-button" style="float: right; margin-right: 5px;">
							  <span class="glyphicon glyphicon-th" aria-hidden="true"></span>
							</button>
							<button type="button" class="radical-simple-button-active" style="float: right">
							  <span class=" glyphicon glyphicon-list" aria-hidden="true"></span>
							</button>
						</div>
						<div class="row" style="margin-top: 10px;">
							<%@include file="../includes/taskList.jsp" %>
						</div>
					</div>
					<div class="col-lg-3">
					
					</div>
              <!-- page end-->
          </section>
      </section>
      
      <!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel" contentEditable="true">UI Design for Homepage</h4>
				      </div>
				      <div class="modal-body">
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
							<div style="padding-left: 20px; padding-top:10px;">
								<div class="alert alert-info alert-dismissible" role="alert">
								  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								  <strong style="padding-right:5px;">July 6, 2015 </strong> 7PM - 10PM 
								</div>
							</div>
							<form class="form-inline" >
							  <div class="form-group">
							    <label for="exampleInputName2"><b>Details</b></label>
							   </div>
							</form>
							<div style="padding-left:20px">
							<p contentEditable="true">
							This is a sentence. You can edit this sentence. A sentence is a group of words. Words are powerful. Therefore a sentence is even more powerful.
							</p>
							
							
							</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
				
		<!-- -end of modal -->		
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
      
      <!--main content end-->
      <!--footer start-->
      <%@include file="../includes/footer.jsp" %>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../js/jquery.scrollTo.min.js"></script>
    <script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="../js/respond.min.js" ></script>

    <!--common script for all pages-->
    <script src="../js/common-scripts.js"></script>

  <script>

      //knob
      $(".knob").knob();

  </script>

  </body>
</html>
