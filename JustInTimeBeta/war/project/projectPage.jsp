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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="../assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet">
<link href="../css/style-responsive.css" rel="stylesheet" />
<link href="../css/radical.css" rel="stylesheet" />

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
						<h3 style="float: left; padding: 0px; margin: 0px;">Project Name</h3>
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
							data-target="#addTaskModal">
							<span class=" glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							new task
						</button>
					</div>
					<div class="row" style="margin-top: 10px;">
						<%@ include file="../includes/taskList.jsp"%>
					</div>
				</div>

				<div id="T1"></div>
				<!-- page end-->
			</section>
		</section>
		<!--main content end-->

		<!--footer start-->
		<%@include file="../includes/footer.jsp"%>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="../js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../js/jquery.scrollTo.min.js"></script>
	<script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="../assets/jquery-knob/js/jquery.knob.js"></script>
	<script src="../js/respond.min.js"></script>
	
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>

	<!--common script for all pages-->
	<script src="../js/common-scripts.js"></script>
	
	<script src="../js/external-dragging-calendar.js"></script>

	<script>
		//knob
		$(".knob").knob();
	</script>

</body>
</html>