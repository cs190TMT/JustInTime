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
					<!-- Task List start -->
					<div class="containerList" id="taskMList">
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

	<!-- js placed at the end of the document so the pages load faster -->

	<%@include file="../includes/footImports.jsp"%>

	<script type="text/javascript">
		$(".knob").knob();
		
		$(document).ready(function() {
			retrieveTaskMasterList("TaskMasterList");
		});
		
	</script>

</body>

</html>
