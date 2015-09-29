<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<%@ page contentType="text/html;charset=UTF8" language="java"
	import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>

<%@ include file="../includes/headImports.jsp"%>

<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/angular.js"></script>
<script type="text/javascript" src="../js/functions.js"></script>
<script type="text/javascript" src="../js/projectFunction.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <script src="../js/respond.min.js"></script>
    <![endif]-->

<title>Just In Time</title>
</head>


<body ng-app="project" ng-controller="projectController">
	<section id="container" class="">
		<!--header start-->
		<%@include file="../includes/header.jsp"%>
		<!--header end-->
		<!--sidebar start-->
		<%@include file="../includes/sidebar.jsp"%>
		<!--sidebar end-->
		<section id="main-content">
			<section class="wrapper">
				<!-- page start-->
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-6">
						<h3 style="float: left; padding: 0px; margin: 0px;">Projects</h3>
						</div>
						<div class="col-lg-6">
						<button type="button" class="radical-simple-button-task"
							style="float: right; margin-right: 5px;" aria-label="Left Align"
							data-toggle="modal" data-target="#addProjectModal">
							<span class=" glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							New Project
						</button>
						</div>
					</div>
					<div class="radical-task-header" style="margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search for projects">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div>
					</div>
					<!-- Project List start-->
					<div class="row containerList listRow listRowProperty">
						<div class="row listRow listRowHeader">
							<div class="col-md-4 listProperty listHeader">Name</div>
							<div class="col-md-4 listProperty listHeader">Details</div>
						</div>
						<div ng-repeat="value in projectList">
							<div class="row listRow listRowProperty projList radical-pin-tasks" id="projectPin{{value.id}}">
								<a ng-href="/projectPage?projectName={{value.projectName}}&id={{value.id}}" style="color: black">
									<div ng-if="checkIfUpdate(value.id)" class="col-md-4 listProperty radical-pin-tasks-name">
										{{value.projectName}}
									</div>
									<div ng-if="checkIfUpdate(value.id)" class="col-md-4 listProperty radical-pin-tasks-details">
										{{value.projectDetails}}
									</div>
								</a>
									<div ng-if="checkIfInput(value.id)">
										
									<div class="radical-pin-tasks-name-edit col-md-3">
										<input ng-model="projName" type="text" data-placement="left" class="form-control"
											onfocus="taskEditChange(this,value.id)" placeholder="" >
									</div>
									<div class="radical-pin-tasks-details-edit col-lg-7">
										<textarea ng-model="projDetails" type="text" data-placement="left" class="form-control" placeholder="">
										</textarea>
									</div>
									
									</div>
												
									<div ng-if="checkIfDelete(value.id)" class="radical-pin-tasks-remove col-lg-10">
										Are you sure you want to delete the project
										<b><span class="removeTaskLabel">
											{{value.projectName}}
										</span></b>?
										<div class="alert alert-warning col-lg-6" role="alert" style="margin-top: 10px; padding:10px;">
											This task will also be removed in projects
										</div>
									</div>
												
									<div class="radical-pin-tasks-controls col-lg-2 text-right radical-no-padding">
										<!-----------First to appear Buttons------------>
										<button ng-if="checkIfUpdate(value.id)" class="btn btn-sm text-right radical-task-btn-edit" ng-click = "projectEditMode(this,value.id, value.projectName,value.projectDetails)">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										</button>
										<button ng-if="checkIfUpdate(value.id)" class="btn btn-sm text-right radical-tasks-btn-remove" ng-click = "projectDeleteMode(this,value.id)">
											<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>
										</button>
										<!-----------Deleting Buttons-------------------------->
										<button ng-if="checkIfDeleteOk(value.id)" class="btn btn-sm text-right radical-tasks-btn-remove-confirm" ng-click = "projectDeleteConfirmed(this,value.id)">
											Delete
										</button>
										<button ng-if="checkIfDelete(value.id)" class="btn btn-sm text-right radical-tasks-btn-cancel-2" ng-click="resetDeleteFlag()">
											Cancel
										</button>
										<!-----------Editing Buttons------------------------>
										<button ng-if="checkIfInput(value.id)" class="btn btn-sm text-right radical-task-btn-save" ng-click = "projectUpdate()">
											Save
										</button>
										<button ng-if="checkIfInput(value.id)" class="btn btn-sm text-right radical-tasks-btn-cancel" ng-click = "resetInputFlag()">
											Cancel
										</button>
									</div>
							</div>
						</div>
					</div>
					<!-- Project List end -->

					<div id="T1"></div>
					<%@ include file="../includes/addLogModal.jsp"%>
					<!-- page end-->
				</div>
			</section>
		</section>
		<!--main content end-->

		<!--footer start-->
		<%@include file="../includes/footer.jsp"%>
		<%@include file="../includes/pullTasksModal.jsp"%>
		<!--footer end-->
	</section>


	<!-- js placed at the end of the document so the pages load faster -->

	<%@include file="../includes/footImports.jsp"%>

	<script>
		//knob
		$(".knob").knob();
		$(document).ready(function() {
			$("#calendar").hide();
			//retrieveProjectList("ProjectList");
		});
	</script>

</body>
</html>