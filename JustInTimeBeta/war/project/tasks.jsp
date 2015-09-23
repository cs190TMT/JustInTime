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
<body ng-app="jitTask" ng-controller="jitController">
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
						<h3 style="float: left; padding: 0px; margin: 0px;">Tasks</h3>
						<div id="updateDisplay"></div>
						<button type="button" class="radical-simple-button-task"
							style="float: right; margin-right:0px" aria-label="Left Align" data-toggle="modal"
							data-target="#addMasterTaskModal">
							<span class=" glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							New Task
						</button>
					</div>

					<div class="radical-task-header" style="margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control radical-search-input"
								placeholder="Search for tasks" id="searchInputMain"> <span
								class="input-group-btn">
								<button class="btn btn-default radical-search-input-btn" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
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
					
					
					<div class="row" style="padding-left: 15px; margin-top: 0px; padding-right: 15px;" id="taskMList" ng-repeat="item in taskList">
							<div class = "row radical-pin-tasks" >
													<div class = "radical-pin-tasks-name col-lg-3">
													{{item.taskName}}
													</div>
													<div class = "radical-pin-tasks-details col-lg-7">
													{{item.taskDetails}}
													</div>
													<div class = "radical-pin-tasks-name-edit col-lg-3" >
													
													</div>
													<div class = "radical-pin-tasks-details-edit col-lg-7 input-group">
													<textarea class="form-control" rows="3" ng-model = "item.taskDetailsx">
												
													</textarea>
													</div>
													<div class = "radical-pin-tasks-remove col-lg-10">
													Are you sure you want to delete the task 
													<b><span class="removeTaskLabel">
													{{item.taskName}}
													</span></b>?
													<div class="alert alert-warning col-lg-6" role="alert" style="margin-top: 10px; padding:10px;">
													This task will also be removed in projects
													</div>
													</div>
													<div class = "radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">
													<button class="btn btn-sm text-right radical-task-btn-edit" onclick = "taskPinEditMode(this)">
													<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</button>
													<button class="btn btn-sm text-right radical-tasks-btn-remove" onclick = "removeClicked(this)">
													<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>
													</button>
													<button class="btn btn-sm text-right radical-tasks-btn-remove-confirm" ng-click = "deleteTask(this, item)">
													delete
													</button>
													<button class="btn btn-sm text-right radical-task-btn-save" ng-click="updateTask(this, item)">
													save
													</button>
													<button class="btn btn-sm text-right radical-tasks-btn-cancel" onclick = "taskPinNormalMode(this)">
													cancel
													</button>
													<button class="btn btn-sm text-right radical-tasks-btn-cancel-2" onclick = "taskPinNormalMode2(this)">
													cancel
													</button>
													</div></div>
				
					</div>
					<div class="row radical-pin-tasks-header-header radical-float-top col-lg-7" style="padding-left: 15px; margin-top: 10px; padding-right: 9px;" id="header2">
						<div class = "row radical-pin-tasks-header" id="searchTaskFake" style="border:0px;">
							<div class="input-group">
							<input type="text" class="form-control radical-search-input"
								placeholder="Search for tasks" > <span
								class="input-group-btn">
								<button class="btn btn-default radical-search-input-btn" type="button">
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
	<script type="text/javascript" src="../js/taskFunctions.js"></script>


	<script type="text/javascript">
		$(".knob").knob();
	

		$(document).ready(function() {
			
			//retrieveTaskMasterList("TaskMasterList");
			
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
			
			$(".radical-search-input").keydown(function(event) {
		        if (event.keyCode == 13) {
		        	var name = $(this).val();
		        	searchTask(name);
		        	$(".radical-search-input").val(name);
		            return false;
		         }
		    });
			
			$(".radical-search-input-btn").click(
				function(){
					var name = $(this).parent().parent().find(".radical-search-input").val();
					searchTask(name);
					$(".radical-search-input").val(name);
				}	
			
			);
			
			tasksReady();
			
		});
		
	</script>

</body>

</html>
