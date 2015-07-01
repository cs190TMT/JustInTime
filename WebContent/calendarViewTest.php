<html>

	<head>
		
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-reset.css" rel="stylesheet">
		<!--external css-->
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<!-- Custom styles for this template -->
		<link href="css/style.css" rel="stylesheet">
		<link href="css/style-responsive.css" rel="stylesheet" />
		<!-- fullcalendar embedding -->
		<link rel='stylesheet' href='fullcalendar-2.3.2/fullcalendar.css' />
		<script src='fullcalendar-2.3.2/lib/jquery.min.js'></script>		
		<script src='fullcalendar-2.3.2/lib/moment.min.js'></script>
		<script src='fullcalendar-2.3.2/fullcalendar.js'></script>
		
	</head>
	
	<body>
	<section id="container" class="">
		<?php /*
		<!--header start-->
		<header class="header white-bg">
			<div class="sidebar-toggle-box">
				<div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
			</div>
			<!--logo start-->
			<a href="index.jsp" class="logo" >JUST<span>in</span>TIME</a>
			<!--logo end-->
			<div class="nav notify-row" style="margin-left:10px;" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
				<!-- settings start -->
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="icon-tasks"></i>
						<span class="badge bg-success">6</span>
					</a>
					<ul class="dropdown-menu extended tasks-bar">
						<div class="notify-arrow notify-arrow-green"></div>
						<li>
							<p class="green">You have 6 pending tasks</p>
						</li>
						<li>
							<a href="#">
								<div class="task-info">
									<div class="desc">Dashboard v1.3</div>
									<div class="percent">40%</div>
								</div>
								<div class="progress progress-striped">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
										<span class="sr-only">40% Complete (success)</span>
									</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="task-info">
									<div class="desc">Database Update</div>
									<div class="percent">60%</div>
								</div>
								<div class="progress progress-striped">
									<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
										<span class="sr-only">60% Complete (warning)</span>
									</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="task-info">
									<div class="desc">Iphone Development</div>
									<div class="percent">87%</div>
								</div>
								<div class="progress progress-striped">
									<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 87%">
										<span class="sr-only">87% Complete</span>
									</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="task-info">
									<div class="desc">Mobile App</div>
									<div class="percent">33%</div>
								</div>
								<div class="progress progress-striped">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 33%">
										<span class="sr-only">33% Complete (danger)</span>
									</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="task-info">
									<div class="desc">Dashboard v1.3</div>
									<div class="percent">45%</div>
								</div>
								<div class="progress progress-striped active">
									<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
										<span class="sr-only">45% Complete</span>
									</div>
								</div>
							</a>
						</li>
						<li class="external">
							<a href="#">See All Tasks</a>
						</li>
					</ul>
				</li>
				<!-- settings end -->
			</ul>
			</div>
			<div class="top-nav ">
				<ul class="nav pull-right top-menu">
					<li>
						<input type="text" class="form-control search" placeholder="Search">
					</li>
					<!-- user login dropdown start-->
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<img alt="" src="img/avatar1_small.jpg">
							<span class="username">Jhon Doue</span>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu extended logout" style="max-width: 100px !important;    min-width: 100px !important;">
							<div class="log-arrow-up"></div>                
							<li><a href="#"style="padding: 15px 25px !important;"><i style="padding: 0px 25px !important; align:center;" class="icon-cog"></i> Settings</a></li>
							<li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
						</ul>
					</li>
					<!-- user login dropdown end -->
				</ul>
			</div>
		</header>
		<!--header end-->
		
		<!--sidebar start-->
		<aside>
			<div id="sidebar"  class="nav-collapse ">
				<!-- sidebar menu start--> 
				<ul class="sidebar-menu" id="nav-accordion">
					<li>
						<a href="home.php" class="active">
							<i class="icon-dashboard"></i>
							<span>JIThub</span>
						</a>
					</li>

					<li class="sub-menu">
						<a href="javascript:;">
							<i class="icon-folder-close"></i>
							<span>Projects</span>
						</a>
						<ul class="sub">
							<li><a  href="boxed_page.html">Project 1</a></li>
							<li><a  href="horizontal_menu.html">Project 2</a></li>
							<li><a  href="language_switch_bar.html">Project 3</a></li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" >
							<i class="icon-tasks"></i>
							<span>Task Lists</span>
						</a>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" >
							<i class="icon-calendar"></i>
							<span>Calendar</span>
						</a>
                      
					</li>
				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		*/
		?>
		
		<?php
			include 'includes/header.php';
			include 'includes/sidebar.php';
		?>
		
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<aside class="col-lg-8">
						<section class="panel">
							<div class="panel-body">
								<div id='calendarWeek'> </div>
							</div>
						</section>
					</aside>
					<aside class="col-lg-4">
						<section class="panel">
							<div class="panel-body">
								<div id='calendarMonth'> </div>
							</div>
						</section>
					</aside>
				</div>
			</section>
		</section>
		<!--main content end-->
	
	</section>
	</body>
	
	<script>
	
		$(document).ready(function() {

		// page is now ready, initialize the calendar...
		
		$('#calendarWeek').fullCalendar({
			// put your options and callbacks here
			contentHeight: 'auto',
			defaultView: 'basicWeek',
			header: {
				left: '',
				center: '',
				right: 'today prev,next',
			}
		})
		
		$('#calendarMonth').fullCalendar({
			// put your options and callbacks here
			contentHeight: 'auto',
				eventSources: [

					// your event source
					{	
						events: [
							{
								title  : 'event1',
								start  : '2015-06-30',
								end    : '2015-07-01'
							},
							{
								title  : 'event2',
								start  : '2015-07-02',
								end    : '2015-07-04'
							},
							{
								title  : 'event3',
								start  : '2015-06-29',
							}
						],
						color: 'yellow',
						textColor: 'black'
					}
				]
					
		})
		
		});
		
	</script>
	
</html>