<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<%! String name,status;%>
<%     
		name=(String)session.getAttribute("name");
		try 
		{
			//flag=0;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:metrics");
            Statement st = con.createStatement();
			String query="Select ResourceName, status, timesheet from [Sheet1$]";
			//String finalquery= querey.concat("'"+name + "'");
            ResultSet rs = st.executeQuery(query);
%>
<Html>
<head>
	<style>
		body {
			background-color: #555555;
			color: whitesmoke;
		 }
		 table{
			margin-top:-350px;
		 }
	</style>
</head>
	<body>
			<table align="center" border="1">
				<th> Resourse Name </th>
				<th> Status	</th>
				<th> Time sheet </th>
<%
			while(rs.next())
			{
%>
				<tr>
				<td>
				<% out.println(rs.getString("ResourceName")); %>
				</td>
				<td>
				<% out.println(rs.getString("status")); %>
				
				</td>	
				 <td>
					 <% out.println(rs.getString("timesheet")); %> 
				</td> 
				</tr>
				</br>
<%			
			}
%>
			</table>
	</body>
</html>
<%
		con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>
