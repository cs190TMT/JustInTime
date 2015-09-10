<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keyword" content="">
<link rel="shortcut icon" href="img/favicon.png">

<title>Just In Time</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

	<div class="container">

		<form class="form-signin" action="/register" method="post">
			<h2 class="form-signin-heading">Sign Up for Free</h2>
			<div class="login-wrap">
				<p>Enter your personal details below</p>
				<input type="text" class="form-control" placeholder="Full Name"
					name="fullName" autofocus> <input type="text"
					class="form-control" placeholder="Email" name="email" autofocus>
				<input type="password" class="form-control" placeholder="Password"
					name="password"> <input type="password"
					class="form-control" placeholder="Re-type Password"> <label
					class="checkbox"> <input type="checkbox"
					value="agree this condition"> I agree to the Terms of
					Service and Privacy Policy
				</label>
				<button class="btn btn-lg btn-login btn-block" type="submit">Submit</button>

				<div class="registration">
					Already Registered. <a class="" href="/login"> Login </a>
				</div>

			</div>

		</form>

	</div>


</body>
</html>
