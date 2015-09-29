<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<aside>
	<div id="sidebar" class="nav-collapse radical-sidebar">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu radical-sidebar-menu" id="nav-accordion">

			<li><a href="/tasks" class="radical-active"> <i
					class="icon-tasks"></i> <span class="radical-font-size">Tasks</span>
					<button type="button" class="radical-add-button"
						data-toggle="modal" data-target="#addMasterTaskModal">
						<span class="glyphicon glyphicon glyphicon-plus-sign"
							aria-hidden="true"><text>Add</text></span>
					</button>
			</a></li>

			<li class="sub-menu"><a href="/projects"
				class="radical-active"> <i class="icon-folder-close"></i> <span
					class="radical-font-size">Projects</span>
					<button type="button" class="radical-add-button"
						data-toggle="modal" data-target="#addProjectModal">
						<span class="glyphicon glyphicon glyphicon-plus-sign"
							aria-hidden="true"><text>Add</text></span>
					</button>
			</a></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<%@include file="../includes/addMasterTaskModal.jsp"%>
<%@include file="../includes/addProjectModal.jsp"%>