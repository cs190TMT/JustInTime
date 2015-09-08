<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<%@ page contentType="text/html;charset=UTF8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>

<%@ include file="../includes/headImports.jsp" %>

<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/angular.js"></script>
<script type="text/javascript" src="../js/functions.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
	      <script src="../js/html5shiv.js"></script>
	      <script src="../js/respond.min.js"></script>
	    <![endif]-->

<title>Just In Time</title>
</head>
<body>
	<section id="container" class="">
		<!--header start-->
		<%@include file="../includes/header.jsp"%>
		<!--header end-->
		<!--sidebar start-->
		<%@include file="../includes/sidebar.jsp"%>
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<!-- page start-->
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-6">
						<h3 style="float: left; padding: 0px; margin: 0px;">Tasks</h3>
						</div>
						<div class="col-lg-6">
						<button type="button" class="radical-simple-button-task"
							style="float: right; margin-right:0px" aria-label="Left Align" data-toggle="modal"
							data-target="#addTaskModal">
							<span class=" glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							New Task
						</button>
						</div>
					</div>
					<div class="radical-task-header" style="margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for tasks" oninput = "searchTask(this.value)"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div>
						<div class="btn-group btn-group-sm" role="group" aria-label="..."
							style="margin-top: 10px;">
							<div class="btn-group btn-group-sm" role="group">
								<button type="button"
									class="btn btn-default dropdown-toggle radical-no-round-corners"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Date <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">All</a></li>
									<li><a href="#">Today</a></li>
									<li><a href="#">Tomorrow</a></li>
									<li><a href="#">This week</a></li>
									<li><a href="#">Next week</a></li>
									<li><a href="#">This month</a></li>
								</ul>
							</div>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Status <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">All</a></li>
									<li><a href="#">Not started</a></li>
									<li><a href="#">In progress</a></li>
									<li><a href="#">Overdue</a></li>
									<li><a href="#">Finished</a></li>
								</ul>
							</div>
							<div class="btn-group btn-group-sm" role="group">
								<button type="button"
									class="btn btn-default dropdown-toggle radical-no-round-corners"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Phase <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">All</a></li>
									<li><a href="#">Planning</a></li>
									<li><a href="#">Design</a></li>
									<li><a href="#">Coding</a></li>
									<li><a href="#">Testing</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="row radical-pin-tasks-header-header" style="padding-left: 15px; margin-top: 10px; padding-right: 15px;" id="header1">
						<div class = "row radical-pin-tasks-header">
							<div class = "radical-pin-tasks-name col-lg-3">
								<b>Name</b>
							</div>
							<div class = "radical-pin-tasks-details col-lg-7">
								<b>Details</b>
							</div>
							<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">
							</div>
						</div>
					</div>
					<div class="row" style="padding-left: 15px; margin-top: 0px; padding-right: 15px;" id="taskMList">
						

						  
						<div class = "row radical-pin-tasks">
							<div class = "radical-pin-tasks-name col-lg-3">
								Name of Project
							</div>
							<div class = "radical-pin-tasks-details col-lg-7">
								Details
							</div>
							<div class = "radical-pin-tasks-name-edit col-lg-3">
								<input type="text" class="form-control" placeholder="" value="Name of Project">
							</div>
							<div class = "radical-pin-tasks-details-edit col-lg-7">
								<textarea class="form-control" rows="3">Details</textarea>
							</div>
							<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">
								<button class="btn btn-sm text-right radical-task-btn-edit">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								</button>
								<button class="btn btn-sm text-right radical-tasks-btn-remove">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<button class="btn btn-sm text-right radical-task-btn-save radical-task-btn-save-disabled">
									save
								</button>
								<button class="btn btn-sm text-right radical-tasks-btn-cancel">
									cancel
								</button>
							</div>
						</div>
						
						

					</div>
					<div class="row radical-pin-tasks-header-header radical-float-top col-lg-7" style="padding-left: 15px; margin-top: 10px; padding-right: 9px;" id="header2">
						<div class = "row radical-pin-tasks-header" id="searchTaskFake" style="border:0px;">
							<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for tasks" oninput = "searchTask(this.value)"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div>
						</div>
						<div class = "row radical-pin-tasks-header" id="headerThings2">
							<div class = "radical-pin-tasks-name col-lg-3">
								<b>Name</b>
							</div>
							<div class = "radical-pin-tasks-details col-lg-7">
								<b>Details</b>
							</div>
							<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">
							</div>
						</div>
					</div>
					<!-- Task List end -->
				</div>
				<div id="T1"></div>
				<!-- page end-->
			</section>
		</section>
		<!--main content end-->
		<br /> <br /> <br />
		<!--footer start-->
		<%@include file="../includes/footer.jsp"%>
		<!--footer end-->
	</section>

	<!-- Confirm Remove Task Modal -->

	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="confirmRemoveTask">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
			  	<div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">Delete Task</h4>
			      </div>
			      <div class="modal-body">
			         Are you sure you want to delete the task <b><span class="removeTaskLabel">Spartan</span></b> ?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" id = "confirmDeleteTask" data-dismiss="modal"  onclick="deleteConfirmed()">Delete</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        
			      </div>
			</div>
		</div>
	</div>



	<!-- js placed at the end of the document so the pages load faster -->

	<%@include file="../includes/footImports.jsp"%>

	<script type="text/javascript">
		$(".knob").knob();
	

		$(document).ready(function() {
			
			retrieveTaskMasterList("TaskMasterList");
			
			$("#header2").hide();
			
			$("#searchTaskFake").hide();
			
			$("#header2").hover(
				function(){
					$("#searchTaskFake").show("200", "linear");	
				}
			
			);
			
			$("#header2").mouseleave(
					function(){
						$("#searchTaskFake").hide("200", "linear");	
					}
				
				);
			
			$(window).scroll(
				function(){
					if ($(window).scrollTop() + 50 > $('.radical-pin-tasks-header-header').offset().top){
							$("#header2").show();
					}
			        else{
			        	$("#header2").hide();
			        }
				}
			
			);
			
			
		});
		
	</script>

</body>

</html>
