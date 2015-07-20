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
	    <meta name="keyword" content="">
    
    	<link rel="shortcut icon" href="img/favicon.png">

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
	    
	    <title>JITHub</title>
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
					<div class="row">
						<div class="col-lg-4">
							<!--widget start-->
							<aside class="profile-nav alt green-border">
								<section class="panel">
									<div class="user-heading alt green-bg">
										<a href="#">
											<img alt="" src="img/profile-avatar.jpg">
										</a>
										<h1>Jonathan Smith</h1>
										<p>jsmith@flatlab.com</p>
									</div>
									<ul class="nav nav-pills nav-stacked">
										<li><a href="javascript:;"> <i class="icon-asterisk"></i> New tasks <span class="label label-primary pull-right r-activity">19</span></a></li>
										<li><a href="javascript:;"> <i class="icon-sun"></i> Tasks Due Today <span class="label label-warning pull-right r-activity">11</span></a></li>
										<li><a href="javascript:;"> <i class="icon-exclamation-sign"></i> Overdue Tasks <span class="label label-danger pull-right r-activity">03</span></a></li>
										<li><a href="javascript:;"> <i class="icon-thumbs-up"></i> Finished Tasks <span class="label label-success pull-right r-activity">10</span></a></li>
									</ul>
								</section>
							</aside>
                      		<!--widget end-->
						</div>
						<div class="col-lg-8">
							<span style="font-size:30pt; ">Your Projects</span> <a href=" ">see all<i class="icon-double-angle-right"></i></a><br/>
							<div class="row">
								<div class="col-lg-6">
									<!--widget start-->
									<div class="panel">
										<div class="panel-body">
											<div class="bio-chart">
												<input class="knob" data-width="101" data-readOnly=true data-height="101" data-displayPrevious=true  data-thickness=".2" value="63" data-fgColor="#4CC5CD" data-bgColor="#e8e8e8">
											</div>
											<div class="bio-desk">
												<h4 class="terques">Project 1 </h4>
												<p>Started : 15 July</p>
												<p>Deadline : 15 August</p>
											</div>
										</div>
									</div>
									<!--widget end-->
									<!--widget start-->
									<div class="panel">
										<div class="panel-body">
											<div class="bio-chart">
												<input class="knob" data-width="101" data-readOnly=true data-height="101" data-displayPrevious=true  data-thickness=".2" value="20" data-fgColor="#FF6C60" data-bgColor="#e8e8e8">
											</div>
											<div class="bio-desk">
												<h4 class="terques">Project 2</h4>
												<p>Started : 15 July</p>
												<p>Deadline : 15 August</p>
											</div>
										</div>
									</div>
									<!--widget end-->
								</div>
								<div class="col-lg-6">
									<!--widget start-->
									<div class="panel">
										<div class="panel-body">
											<div class="bio-chart">
												<input class="knob" data-width="101" data-readOnly=true data-height="101" data-displayPrevious=true  data-thickness=".2" value="80" data-fgColor="#A9D86E" data-bgColor="#e8e8e8">
											</div>
											<div class="bio-desk">
												<h4 class="terques">Task Management App</h4>
												<p>Started : 15 July</p>
												<p>Deadline : 15 August</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<section class="panel">
								<header class="panel-heading">
									Messages
									<span class="tools pull-right">
										<a class="icon-chevron-down" href="javascript:;"></a>
										<a class="icon-remove" href="javascript:;"></a>
									</span>
								</header>
								<div class="panel-body">
									<div class="timeline-messages">
										<!-- Comment -->
										<div class="msg-time-chat">
											<a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
											<div class="message-body msg-in">
												<span class="arrow"></span>
												<div class="text">
													<p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 10th July 2013</p>
													<p>[ATTENTION] July 12 is the Philippine Independence Day. Nobody shall report tomorrow. Work shall resume on July 13. </p>
												</div>
											</div>
										</div>
										<!-- /comment -->
										<!-- Comment -->
										<div class="msg-time-chat">
											<a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg" alt=""></a>
											<div class="message-body msg-out">
												<span class="arrow"></span>
												<div class="text">
													<p class="attribution"> <a href="#">Jonathan Smith</a> at 2:01pm, 13th April 2013</p>
													<p>[Daily Time Sheet] Tomorrow is the deadline for your Time Sheet for the month of May.</p>
												</div>
											</div>
										</div>
										<!-- /comment -->
										<!-- Comment -->
										<div class="msg-time-chat">
											<a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
											<div class="message-body msg-in">
												<span class="arrow"></span>
												<div class="text">
													<p class="attribution"><a href="#">Jhon Doe</a> at 2:03pm, 13th April 2013</p>
													<p>[Company Shirt Day] Tomorrow is Company Shirt Day. Everyone is advised to wear their respective company shirts.</p>
												</div>
											</div>
										</div>
										<!-- /comment -->
										<!-- Comment -->
										<div class="msg-time-chat">
											<a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg" alt=""></a>
											<div class="message-body msg-out">
												<span class="arrow"></span>
												<div class="text">
													<p class="attribution"><a href="#">Jonathan Smith</a> at 2:05pm, 13th April 2013</p>
													<p>[Acquaintance Party] Acquaintance Party on July 15. Everyone is advised to finish work by 3:30pm. Assembly time is at 4:30pm at the Cebu Trade Hall.</p>
												</div>
											</div>
										</div>
										<!-- /comment -->
										<!-- Comment -->
										<div class="msg-time-chat">
											<a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
											<div class="message-body msg-in">
												<span class="arrow"></span>
												<div class="text">
													<p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 13th April 2013</p>
													<p>[BURGER DAY] All employees shall receive a burger in commemoration of the National Burger Day. Burgers are in the pantry by 3pm.</p>
												</div>
											</div>
										</div>
										<!-- /comment -->
									</div>
								</div>
							</section>
						</div>
						<div class="col-lg-6">
							<section class="panel">
								<header class="panel-heading">
									Your Tasks Due Today
									<span class="tools pull-right">
										<a class="icon-chevron-down" href="javascript:;"></a>
										<a class="icon-remove" href="javascript:;"></a>
									</span>
								</header>
								<div class="panel-body">
									<table class="table table-hover personal-task">
										<tbody>
											<tr>
												<td>1</td>
												<td>
													Target Sell
												</td>
												<td>
													<span class="badge bg-important">75%</span>
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>
													Product Delivery
												</td>
												<td>
													<span class="badge bg-success">43%</span>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>
													Payment Collection
												</td>
												<td>
													<span class="badge bg-info">67%</span>
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>
													Work Progress
												</td>
												<td>
													<span class="badge bg-warning">30%</span>
												</td>
											</tr>
											<tr>
												<td>5</td>
												<td>
													Delivery Pending
												</td>
												<td>
													<span class="badge bg-primary">15%</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>
						</div>
					</div>
					<!-- page end-->
				</section>
			</section>
			<!--main content end-->
			<br/><br/><br/>
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
