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

<!-- Custom CSS for Calendar -->
<link href='../css/fullcalendar.css' rel='stylesheet' />
<link href='../css/fullcalendar.print.css' rel='stylesheet'
	media='print' />

<style>
body {
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 700px;
	margin: 0 auto;
}
</style>

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
	<%
		String projectName = request.getParameter("projectName");
		String id = request.getParameter("id");
		pageContext.setAttribute("projectName", projectName);
		pageContext.setAttribute("id", id);
	%>
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
						<h3 style="float: left; padding: 0px; margin: 0px;"><%=projectName%></h3>
						<input id="projectId" type="hidden" value="<%=id%>">
						</div>
						<div class="col-lg-6">
						<button id="calendarButton" type="button"
							class="radical-simple-button"
							style="float: right; margin-right: 5px;">
							<span class="glyphicon glyphicon-th" aria-hidden="true"></span>
						</button>
						<button id="listButton" type="button"
							class="radical-simple-button-active" style="float: right">
							<span class=" glyphicon glyphicon-list" aria-hidden="true"></span>
						</button>
						<button type="button" class="radical-simple-button-task"
							style="float: right" aria-label="Left Align" data-toggle="modal"
							data-target="#pullTasksModal" onclick="retrievePullTaskMasterList()">
							<span class=" glyphicon glyphicon-arrow-down" aria-hidden="true"></span>
							
						</button>
						</div>
					</div>
					<div class="radical-task-header" style="margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for tasks in this project"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div>
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
					<div class="containerList" id="taskMList">
					</div>
				</div>

				<br />
				<div class="" style="margin-top: 150px; margin-right: 300px;"
					id="calendar"></div>
				<div id="T1"></div>
				<%@ include file="../includes/addLogModal.jsp"%>
				<!-- page end-->
			</section>
		</section>
		<!--main content end-->

		<!--footer start-->
		<div style="postion: fixed; bottom: 0px">
		<%@include file="../includes/footer.jsp"%>
		</div>
		<!-- footer end -->
		<%@include file="../includes/pullTasksModal.jsp"%>
	</section>


	<!-- js placed at the end of the document so the pages load faster -->


	<script src="../lib/moment.min.js" type="text/javascript"></script>
	<script src="../lib/jquery.min.js" type="text/javascript"></script>
	<script src="../js/fullcalendar.min.js" type="text/javascript"></script>
	
	<%@include file="../includes/footImports.jsp"%>
	<%@include file="logsModal.jsp"%>

	<script>
		//knob
		$(".knob").knob();

		$(document).ready(function() {
			//alert("here");
			setCalendar2();
			
			$("#calendar").hide();
			retrieveTaskProjectList("TaskProjectList");
			retrievePullTaskMasterList("TaskMasterList");
		});
		
		$("#calendarButton").click(function(){
			 $("#calendar").show();
			 $("#taskMList").hide();
		});
		
		$("#listButton").click(function(){
			 $("#calendar").hide();
			 $("#taskMList").show();
		});
		
		
	</script>

</body>
</html>
