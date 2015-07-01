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
		<%@include file="includes/header.jsp" %>
		<%@include file="includes/sidebar.jsp" %>
		
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
	<%@include file="includes/footer.jsp" %>
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