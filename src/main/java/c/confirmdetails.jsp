<html>
	<head> 
		<title> Confirm details </title>
		<style>
			body{
				background-color:#555555;
				color:whitesmoke;
				text-align:center;
			}
		</style>
		<script type="text/javascript">
		function goBack()
		{
			window.history.back()
		}
		</script>
	</head>
	<body>
		<h2> Hi <%out.println((String)session.getAttribute("name"));%> </h2>
		<h3> Below are the details you are provided please confirm them </h3>
		<form name="confirm" action=" home_inter.jsp" method="post" >
		<table align="center">
		<tr> <td><h2>Bugs according to priority are </h2></td></tr>
			<tr> <td align="right"><h4> Number of p1 bugs </td> <td> <input type="text" readonly name="p1" value=<%out.println(request.getParameter("p1"));%> > </h4></td></tr>
			<tr> <td align="right"><h4>Number of p2 bugs</td> <td><input type="text" readonly name="p2" value = <%out.println(request.getParameter("p2"));%> ></input> </h4></td></tr>
			<tr> <td align="right"><h4>Number of p3 bugs </td> <td><input type="text" readonly name="p3" value = <%out.println(request.getParameter("p3"));%> > </input></h4></td></tr>
			<tr> <td align="right"><h4>Number of p4 bugs </td> <td><input type="text" readonly name="p4" value =<%out.println(request.getParameter("p4"));%> > </input> </h4></td></tr>
		</table>
		<table align="center">
			<tr> <td><h2>Bugs according to Defect type are </h2></td></tr><br> <br>
			<tr> <td align="right" ><h4>Number of User interface bugs </h4></td> <td><input type="text" readonly name="ui" value= <%out.println(request.getParameter("ui"));%> >  </input> </h4></td></tr>
			<tr> <td align="right"><h4>Number of functional bugs</td> <td> <input type="text" readonly name ="fun" value= <%out.println(request.getParameter("fun"));%> > </input> </h4></td></tr>
			<tr> <td align="right"><h4>Number of Calculation bugs </td> <td><input type="text" readonly name ="calc" value= <%out.println(request.getParameter("calc"));%>  > </input> </h4></td></tr>
			<tr> <td align="right"><h4>Number of Validational bugs </td> <td><input type="text" readonly name ="val" value= <%out.println(request.getParameter("val"));%>  > </input></h4></td></tr>
			<tr> <td align="right"><h4>Number of Navigation bugs </td> <td><input type="text" readonly name ="nav" value= <%out.println(request.getParameter("nav"));%>  > </input> </h4> <br></td></tr>
				<tr> <td align="right"><h2> Total Number of bugs </td> <td><input type="text" readonly name="total" value=<%out.println(request.getParameter("total"));%> > </input> </h2></td></tr>
		</table>
		<% String sproject=request.getParameter("team");%>
		<input type="hidden" name="team" value="<%= sproject %>" />
			<input type="button" value="Back" onclick="goBack()">
			<input type="submit" value="Confirm" />
		</form>
	</body>
</html>