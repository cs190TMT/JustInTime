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
						data-toggle="modal" data-target="#addTaskModal">
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

			<!--  [Project List] -->
			<li class="sub-menu radical-submenu"><a href="/projectPage"
				style="padding-left: 35px;"> <span
					class="badge radical-badge radical-badge-project glyphicon glyphicon-file"
					style="margin-right: 5px;"> </span> <span class="submenu-text">
						Project 1</span>
			</a></li>
			<!--  [END: Project List] -->

		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<%@include file="../includes/addMasterTaskModal.jsp"%>
<%@include file="../includes/addProjectModal.jsp"%>

