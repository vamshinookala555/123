<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<%! String id, pass ,name,columnValue, columnValue1, s2,team,query, date,fquery; %>
<%
	try
	{
		
		name=(String)session.getAttribute("name");
		 date=request.getParameter("ch1");
		 String location=request.getParameter("Abs");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:metrics");
            Statement st = con.createStatement();
			
			
			//String query=" update [Sheet1$] set x = 'Mon' where ResourceName = '";
			//String fquery=query.concat(name + "'");
			//System.out.print(fquery);
			//PreparedStatement pt=con.prepareStatement(fquery);
			//ResultSet rs=pt.executeQuery();
			//System.out.print(fquery);
			//st.executeUpdate(fquery);
			//st.executeUpdate("Update [Sheet1$] set date='Wed' where ResourceName='vamshi'");
			
			
			String query=" update [Sheet1$] set x = '";
			String squery=query.concat(date + " ' where ResourceName= '");
			String fquery=squery.concat(name + " '");
			System.out.println(fquery);
			st.executeUpdate(fquery);
			//Connection con1 = DriverManager.getConnection("jdbc:odbc:metrics");
            //Statement st1 = con.createStatement();
			String query1=" update [Sheet1$] set venue = '";
			String squery1 = query1.concat(location + " ' where ResourceName= '");
			String fquery1= squery1.concat(name + " '");
			System.out.println(fquery1);
			st.executeUpdate(fquery1);
			con.close();
	}
    catch (Exception ex) 
    {
          ex.printStackTrace();
    }
%>
<Html>
	
	<head>
	
	<style>
			body{
					text-align:center;
					background-color:#555555;
					color:whitesmoke;
				}
		</style>
		
	</head>
	<body>
	<H2> Thank You <H2>
	</body>
</html>




