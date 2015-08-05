<Html>
	<Head>
		<Title> Defect Metrics -Home</Title>
		<style>
			body{
				text-align:center;
				background-color:#555555;
				color:whitesmoke;
			}
		</style>
		<script type="text/javascript">
			
		function Sum(name)
		{
			var t=0;
			for(var j=1;j<5;j++)
			{
				t=t+Number(document.getElementById('p'+j).value);
			}
			document.Details.totalp.value=Number(t);
			
		}
		function equal1()
		{
			
			var temp, total1=0;
			
			for( var i=1;i<6; i++)
			{
				temp = document.getElementById('bt'+i).value;
				if(temp=="")
				{
					document.getElementById('bt'+i).value="0";
				}
				
				total1 += Number(temp);
			}
			document.Details.total.value=Number(total1);
		}
		function validate()
		{
			var flag=true;
			var priotitytotal,defecttypetotal;
			var total1= 0;
			var temp=0;
			for( var i=1;i<6; i++)
			{
				temp = document.getElementById('bt'+i).value;
				total1 += Number(temp);
			}
	
			if(total1 !=(Number(document.getElementById('totalp').value)))
			{
				alert( "Total number of bugs according to priorty and type should be same");
				flag= false;
				return flag;
			}
			var project= document.getElementById('project').value;
			var pro=confirm("You are submitting to project:  "+ project);
			if(pro)
				flag = true;
			else
				flag = false;
			
			return flag;
		}
		</script>

	</Head>
	<Body bgcolor="445533" >
	<font color="yellow">
	<Form name = "Details" id = "Details1" action = "confirmdetails.jsp" onsubmit=" return validate() " method = "post">
	<table align="center">
	<tr> <h2> Please enter bugs according to priorty</h2> </tr>
		<tr> <td align= "right"><h4>Number of p1 bugs</h4> </td> <td> <input type = "text" id = "p1" name ="p1" maxsize= "4" value= "0" placeholder ="0" onBlur = "Sum('p1')"/><br> </td> </tr>
		<tr> <td align= "right"><h4> Number of p2 bugs</h4></td> <td> <input type = "text" id = "p2" name ="p2" maxsize= "4" value= "0" placeholder ="0" onBlur = "Sum('p2')"/><br> </td></tr>
		<tr> <td align= "right"> <h4>Number of p3 bugs </h4></td> <td> <input type = "text" id = "p3" name ="p3" maxsize= "4" value= "0" placeholder ="0" onBlur = "Sum('p3')"/><br> </td> </tr>
		<tr> <td align= "right"><h4>Number of p4 bugs </h4></td><td><input type = "text" id = "p4" name ="p4" maxsize= "4" value= "0" placeholder ="0" onBlur = "Sum('p4') "/><br></td></tr>
		<tr> <td align= "right"> <h3>Total Number of bugs according to priority</h3></td> <td><input type="text" id="totalp" name="totalp" value= "0" readonly/></br> </td> </tr>
	</table>
	<table align="center">
				<tr> <br> <h2>Please enter bugs according to Defect type</h2><br></tr>
		<tr> <td align= "right" ><h4>Number of User interface bugs </h4></td> <td> <input type = "text" id = "bt1" name ="ui" value= "0" placeholder ="0" onBlur = "equal1('ui')" /><br></td></tr>
		<tr> <td align= "right"><h4>Number of functional bugs </h4></td> <td><input type = "text" id = "bt2" name ="fun" value= "0" placeholder ="0" onBlur = "equal1('fun')"/><br></td> </tr>
		<tr> <td align= "right"> <h4>Number of Calculation bugs</h4></td> <td> <input type = "text" id = "bt3" name ="calc" value= "0" placeholder ="0" onBlur = "equal1('calc')"/><br></td></tr>
		<tr> <td align= "right"> <h4>Number of Validation bugs </h4></td> <td> <input type = "text" id = "bt5" name ="val" value= "0" placeholder ="0" onBlur = "equal1('val')"/><br></td> </tr>
		<tr> <td align= "right"> <h4>Number of Navigation bugs </h4></td> <td><input type = "text" id = "bt4" name ="nav" value= "0" placeholder ="0" onBlur = "equal1('nav')"/><br></td> </tr>
		<tr> <td align= "right"> <h3>Total Number of bugs according to type </h3></td> <td><input type="text" id="total" name="total" value= "0" readonly/></br></td></tr>
	</table>
		</br>
		<% String sproject=request.getParameter("project");%>
		<input type="hidden" name="team" value="<%= sproject %>" />
		<input type="submit" id = "SUBMIT" value = "submit"/>
	</Form>
	</font>
	</Body>
</Html>