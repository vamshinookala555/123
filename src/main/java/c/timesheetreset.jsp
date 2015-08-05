<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import= "java.lang.*" %>
<%
	try
	{
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/timesheet.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		//int flag=0;
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_NUMERIC) 
				{
					mycell.setCellValue(0);
				}
			}
		}
		workbook.getCreationHelper().createFormulaEvaluator().evaluateAll();
		FileOutputStream fileOut = new FileOutputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/timesheet.xls");
		workbook.write(fileOut);
		fileOut.close();
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:metrics");
            Statement st = con.createStatement();
			String query="update [Sheet1$] set timesheet='Not updated'";
			//String fquery=query.concat(name + "'");
			//System.out.print(fquery);
			st.executeUpdate(query);
			con.close();
	}
	catch (Exception ex) 
    {
            System.err.print("Exception: ");
            System.err.println(ex.getMessage());
    }
%>
<Html>
<head> 
		<title> Reset values </title>
		<style>
			body{
				background-color:#555555;
				color:whitesmoke;
				text-align: center;
				padding-top:5em;
			}
		</style>
	</head>
	<body>
		<h1> you have succesfully rested all values of timesheet</h1>
	</body>
</Html>
