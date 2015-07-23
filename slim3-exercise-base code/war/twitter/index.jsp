<!------------------------------------------------------------------------------
  Unauthorized copying of this file, via any medium is strictly prohibited
  Proprietary and confidential
  Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
-------------------------------------------------------------------------------->
<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!--TODO: Create controller class for updating a tweet [ and deleting a tweet(optional) ].
	HOW TO CREATE A CONTROLLER 
	1. Right click on src/sample.controller.twitter package.
	2. Select New > Class
	3. Type in the Name of the class (It must end with 'Controller'). ex. UpdateController, UpdateTweetController
	4. Click on the browse button for superclass.
	5. Select org.slim3.controller.Controller as the superclass.
	6. Make sure the inherit abstract methods checkbox is checked.
	7. Click on the 'Finish' button.
 -->

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>twitter Index</title>
		<link rel="stylesheet" type="text/css" href="/css/global.css" />
	</head>
	<body>
		<p>What are you doing?</p>
		<form method="post" action="tweet">
			<textarea name="content"></textarea><br />
			<input type="submit" value="tweet" />
		</form>
		<h4>Posts</h4>
		<c:forEach var="e" items="${tweetList}">
			<hr />
			<!-- TODO: provide the update tweet controller url to the action attribute of the form below. -->
			<form id="form_${f:h(e.id)}" name="form_${f:h(e.id)}" method="post" action="/twitter/update">
				<textarea name="content">${f:h(e.content)}</textarea> ${f:h(e.createdDate)}
				<input type="hidden" name="id" value="${f:h(e.id)}"/>
				<input type="hidden" name="createdDate" value="${f:h(e.createdDate)}"/>
				<input type="submit" value="Save" />
				<input type="submit" value="Delete" onClick="changeAction(form_${f:h(e.id)})"/>
				<!-- TODO: Create button for deleting this tweet, hint: use an onClick event to call a javascript function and this form's id as parameter. (optional) -->
			</form>
		</c:forEach>
	</body>
	<!-- TODO: Follow instructions in war/js/tweet.js -->
	<script type="text/javascript" src="/js/tweet.js"></script>
</html>