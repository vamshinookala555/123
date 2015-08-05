<%! String sproject;%>
<Html>
	<head>
		<style type="text/css">
		h1{
			padding-top: 5em;
		}
		 body {
			background-color: #555555;
			color: whitesmoke;
			text-align: center }
		</style>
	</head>
	<body>
		<h1> Welcome <%out.println((String)session.getAttribute("name"));%> </h1>
		<Form name = "Details" id = "Details1" class ="details" action = "admin_metrics.jsp" method = "post">
		<h3>Please select project <select name="project" id="project">
								<option value="AE"> AE </option>
								<option value="C&W"> C&W </option>
								<option value="Developer"> Developer </option>
								<option value="ARGUS-DCF"> ARGUS-DCF </option>
								<option value="AOD"> AOD</option>
								<option value="ACRM"> ACRM </option>
								<option value="ARGUS Express"> ARGUS Express </option>
								<option value= "Developer Budget">Developer Budget </option> 
								</select> </br> </br>
		
		<input class="submit" type="submit" id = "SUBMIT" value = "Enter"/>
		</h3>
		</form>
	</body>
</html>