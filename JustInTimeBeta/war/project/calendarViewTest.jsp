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
	<style>
		h6{
			text-align: center;
			border-radius: 5px;
			color:white;
			padding: 5px;
		}
		.code{
			background-color: green;
		}
		.design{
			background-color: indigo;
		}
		.testing{
			background-color: orange;
		}	
	</style>
	<body>
	<section id="container" class="">
			<%@include file="includes/header.jsp"%>
			<%@include file="includes/sidebar.jsp"%>
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<aside class="col-lg-3">
						<section class="panel">
							<div class="panel-body">
								<h3>Task Here</h3>
								<h6  class='testing'id="drag0" draggable="true" ondragstart="drag(event)">Take A Bath</h6>
								<h6  class='testing'id="drag1" draggable="true" ondragstart="drag(event)">Eat Beakfast</h6>
								<h6  class='testing'id="drag2" draggable="true" ondragstart="drag(event)">Feed The Dogs</h6>
								<h6  class='testing'id="drag3" draggable="true" ondragstart="drag(event)">Brush Teeth</h6>
								<h6  class='testing'id="drag4" draggable="true" ondragstart="drag(event)">Gorcery Time</h6>
								<h6  class='testing'id="drag5" draggable="true" ondragstart="drag(event)">Go to work</h6>
								<h6  class='testing'id="drag6" draggable="true" ondragstart="drag(event)">Sleep</h6>
								<h6  class='design'id="drag10" draggable="true" ondragstart="drag(event)">Take A Bath</h6>
								<h6  class='design'id="drag11" draggable="true" ondragstart="drag(event)">Eat Beakfast</h6>
								<h6  class='design'id="drag12" draggable="true" ondragstart="drag(event)">Feed The Dogs</h6>
								<h6  class='design'id="drag13" draggable="true" ondragstart="drag(event)">Brush Teeth</h6>
								<h6  class='design'id="drag14" draggable="true" ondragstart="drag(event)">Gorcery Time</h6>
								<h6  class='design'id="drag15" draggable="true" ondragstart="drag(event)">Go to work</h6>
								<h6  class='design'id="drag16" draggable="true" ondragstart="drag(event)">Sleep welalalalalalalalalalalalalala</h6>
								<h6  class='code'id="drag20" draggable="true" ondragstart="drag(event)">Take A Bath</h6>
								<h6  class='code'id="drag21" draggable="true" ondragstart="drag(event)">Eat Beakfast</h6>
								<h6  class='code'id="drag22" draggable="true" ondragstart="drag(event)">Feed The Dogs</h6>
								<h6  class='code'id="drag23" draggable="true" ondragstart="drag(event)">Brush Teeth</h6>
								<h6  class='code'id="drag24" draggable="true" ondragstart="drag(event)">Gorcery Time</h6>
								<h6  class='code'id="drag25" draggable="true" ondragstart="drag(event)">Go to work</h6>
								<h6  class='code'id="drag26" draggable="true" ondragstart="drag(event)">Sleep</h6>
							</div>
						</section>
					</aside>
					<aside class="col-lg-9">
						<section class="panel">
							<div class="panel-body">
								<div id='calendarMonth' ondrop="drop(event)" ondragover="allowDrop(event)"> </div>
							</div>
						</section>
					</aside>
				</div>
			</section>
		</section>
		<!--main content end-->
	</section>
		<%@include file="includes/footer.jsp"%>
	</body>
	<script>
		$(document).ready(function() {
			$('#calendarMonth').fullCalendar({
				// put your options and callbacks here
				contentHeight: 'auto',
					eventSources: [
						// your event source
					]
			})
		});
	</script>
	<script>
		function allowDrop(ev) {
		    ev.preventDefault();
		}
		function drag(ev) {
		    ev.dataTransfer.setData("text", ev.target.id);
		}
		function drop(ev) {
		    ev.preventDefault();
		    var data = ev.dataTransfer.getData("text");
		    ev.target.appendChild(document.getElementById(data));
		}
	</script>
</html>