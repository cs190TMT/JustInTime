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
					<div class="containerList" id="projectList">
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
			retrieveProjectList("ProjectList");
		});
	</script>

</body>
</html>
