<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTTPS Checker</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<style>
body {
	padding-top: 54px;
}

i.ok {
	color: green;
}

i.notok {
	color: red;
}

@media ( min-width : 992px) {
	body {
		padding-top: 56px;
	}
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/75b9473010.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">HTTPS Checker</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse"></div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">

		<div class="starter-template">

			<p class="lead">HTTPS Checker runs few simple checks to see if your servlet 
			container is seeing https correctly.</p>

			<p>
				<%
					int okCount = 0;
				%>
				Scheme: <%=request.getScheme()%>
				<%
					if (request.getScheme().equals("https")) {
						okCount++;
				%><i
					class="fa fa-check ok" aria-hidden="true"></i>
				<%
					} else {
				%><i class="fa fa-times notok" aria-hidden="true"></i>
				<%
					}
				%><br> 
				
				Server port: <%=request.getServerPort()%>
				<%
					if (request.getServerPort() == 443) {
						okCount++;
				%>
				<i class="fa fa-check ok" aria-hidden="true"></i>
				<%
					} else {
				%>
				<i class="fa fa-times notok" aria-hidden="true"></i>
				<%
					}
				%><br>
				
				Is secure: <%=request.isSecure()%>
				<%
					if (request.isSecure()) {
						okCount++;
				%>
				<i class="fa fa-check ok" aria-hidden="true"></i>
				<%
					} else {
				%>
				<i class="fa fa-times notok" aria-hidden="true"></i>
				<%
					}
				%><br>
			</p>
			<p>
				Checks
				<% if (okCount == 3) { %>
				PASS <i class="fa fa-check ok" aria-hidden="true"></i>
				<% } else { %>
				FAIL <i class="fa fa-times notok" aria-hidden="true"></i>
				<%	} %>
			</p>
			<p>
				Request URL: <%=request.getRequestURL().toString()%><br>
				Server name: <%=request.getServerName()%><br>
			</p>
		</div>

		<hr>
		<a name="contact"></a> Created by <a href="https://jguru.fi">Mika Koivisto</a> &copy; 2017
	</div>

</body>
</html>
