<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!--main content start-->
<section id="main-content-2">
	<section class="wrapper">
		<!-- page start-->
		<div class="col-lg-9">
			<div class="row">
				<h3 style="float: left; padding: 0px; margin: 0px;">Project 1</h3>
				<a href="/calendarPage" class="radical-simple-button"
					style="float: right; margin-right: 5px;"> <span
					class="glyphicon glyphicon-th" aria-hidden="true"></span>
				</a>
				<button type="button" class="radical-simple-button-active"
					style="float: right">
					<span class=" glyphicon glyphicon-list" aria-hidden="true"></span>
				</button>
				<button type="button" class="radical-simple-button-task"
					style="float: right" aria-label="Left Align" data-toggle="modal"
					data-target="#addLogModal">
					<span class=" glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					new log
				</button>
			</div>
			<div class="row" style="margin-top: 10px;">
				<%@include file="../includes/taskList.jsp"%>
			</div>
		</div>
		<div class="col-lg-3"></div>

		<%@include file="../includes/addLogModal.jsp"%>
		<!-- page end-->
	</section>
</section>
<!--main content end-->