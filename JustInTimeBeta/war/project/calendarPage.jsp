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
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<!-- page start-->
				<div class="col-lg-9">
					<div class="row">
						<h3 style="float: left; padding: 0px; margin: 0px;">Tasks</h3>
						<button id="calendarButton" type="button" class="radical-simple-button"
							style="float: right; margin-right: 5px;">
							<span class="glyphicon glyphicon-th" aria-hidden="true"></span>
						</button>
						<button id="listButton" type="button" class="radical-simple-button-active"
							style="float: right">
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
						             <jsp:include page="../includes/calendar.jsp" />
					</div>
				</div>
				<div class="col-lg-3">
					<c:forEach var="e" items="${taskMasterList}">
						<hr />
						<input type="text" value="${f:h(e.id)}" />
						<input type="text" value="${f:h(e.taskName)}" />
					</c:forEach>
				</div>

				<div id="T1">
				
				
				 
				
				</div>

				<!-- page end-->
			</section>
		</section>
		<!--main content end-->
		<br />
		<br />
		<br />
		<!--footer start-->
		<%@include file="../includes/footer.jsp"%>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script class="include" type="text/javascript"
		src="../js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../js/jquery.scrollTo.min.js" type="text/javascript"></script>
	<script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="../assets/jquery-knob/js/jquery.knob.js"
		type="text/javascript"></script>
	<script src="../js/respond.min.js" type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="../js/common-scripts.js" type="text/javascript"></script>
	    <!--script for this page only-->
    <script src="js/external-dragging-calendar.js"></script>
	
	<script type="text/javascript">
			//knob
			$(".knob").knob();
			
			var Script = function () {


			    /* initialize the external events
			     -----------------------------------------------------------------*/

			    $('#external-events div.external-event').each(function() {

			        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			        // it doesn't need to have a start or end
			        var eventObject = {
			            title: $.trim($(this).text()) // use the element's text as the event title
			        };

			        // store the Event Object in the DOM element so we can get to it later
			        $(this).data('eventObject', eventObject);

			        // make the event draggable using jQuery UI
			        $(this).draggable({
			            zIndex: 999,
			            revert: true,      // will cause the event to go back to its
			            revertDuration: 0  //  original position after the drag
			        });

			    });


			    /* initialize the calendar
			     -----------------------------------------------------------------*/

			    var date = new Date();
			    var d = date.getDate();
			    var m = date.getMonth();
			    var y = date.getFullYear();

			    $('#calendar').fullCalendar({
			        header: {
			            left: 'prev,next today',
			            center: 'title',
			            right: 'month,basicWeek,basicDay'
			        },
			        editable: true,
			        droppable: true, // this allows things to be dropped onto the calendar !!!
			        drop: function(date, allDay) { // this function is called when something is dropped

			            // retrieve the dropped element's stored Event Object
			            var originalEventObject = $(this).data('eventObject');

			            // we need to copy it, so that multiple events don't have a reference to the same object
			            var copiedEventObject = $.extend({}, originalEventObject);

			            // assign it the date that was reported
			            copiedEventObject.start = date;
			            copiedEventObject.allDay = allDay;

			            // render the event on the calendar
			            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

			            // is the "remove after drop" checkbox checked?
			            if ($('#drop-remove').is(':checked')) {
			                // if so, remove the element from the "Draggable Events" list
			                $(this).remove();
			            }

			        },
			        events: [
			            {
			                title: 'All Day Event',
			                start: new Date(y, m, 1)
			            },
			            {
			                title: 'Long Event',
			                start: new Date(y, m, d-5),
			                end: new Date(y, m, d-2)
			            },
			            {
			                id: 999,
			                title: 'Repeating Event',
			                start: new Date(y, m, d-3, 16, 0),
			                allDay: false
			            },
			            {
			                id: 999,
			                title: 'Repeating Event',
			                start: new Date(y, m, d+4, 16, 0),
			                allDay: false
			            },
			            {
			                title: 'Meeting',
			                start: new Date(y, m, d, 10, 30),
			                allDay: false
			            },
			            {
			                title: 'Lunch',
			                start: new Date(y, m, d, 12, 0),
			                end: new Date(y, m, d, 14, 0),
			                allDay: false
			            },
			            {
			                title: 'Birthday Party',
			                start: new Date(y, m, d+1, 19, 0),
			                end: new Date(y, m, d+1, 22, 30),
			                allDay: false
			            },
			            {
			                title: 'Click for Google',
			                start: new Date(y, m, 28),
			                end: new Date(y, m, 29),
			                url: 'http://google.com/'
			            }
			        ]
			    });


			}();

		</script>
	
</body>
</html>
