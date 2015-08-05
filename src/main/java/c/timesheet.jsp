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
		<Form name = "Details" id = "Details1" class ="details" action = "timesheetfinal.jsp" method = "post">
		<h3>Please select project <select name="projects" id="projects">
								<option value= "AE 10.1 Hotfixes"> AE 10.1 Hot fixes </option>
								<option value= "AE 10.5 Hotfixes"> AE 10.5 Hot fixes</option>
								<option value= "AE 10.6 Project Plan"> AE 10.6 Project plan </option>
								<option value= "AE 10.6 Hotfixes"> AE 10.6 Hot fixes</option>
								<option value= "AE 11.0 Project Plan"> AE 11.0 Project Plan</option>
								<option value= "AE - Third Line Support"> AE - 3rd Line Support</option>
								<option value= "DCF - Third Line Support"> DCF - 3rd Line Support</option>
								<option value= "Developer 7.5"> Developer 7.5 </option>
								<option value= "AD Hot fixes & Service packs"> AD Hot fixes & Service Packs</option>
								<option value= "Argus on Demand Phase 2"> Argus on Demand Phase 2 </option>
								<option value= "DCFX (Argus Express)">DCFX (Argus Express) </option> 
								<option value= "Automation Project">Automation Project </option> 
								<option value= "Meetings/Management/ Training/Education"> Meetings and other </option>
								<option value= "Vacation/holiday/Sick time/Compensation off">Leave</option>
								<option value= "Company Holiday"> Company Holiday </option>
								</select> </br> </br>
			Please select type of hours <select name="type1" id="type1">
								<option value="Project Hours">Project Hours </option>
								</select> </br> </br>
			Enter number of hours <input type= "text" id= "hours" name="hours" value= "0" placeholder ="0"/> </br> </br>
		
		<input class="submit" type="submit" id = "SUBMIT" value = "Enter"/>
		</h3>
		</form>
	</body>
</html>