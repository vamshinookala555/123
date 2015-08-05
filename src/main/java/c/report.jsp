<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%
	try
	{
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files/Apache Software Foundation/apache-tomcat-7.0.42/webapps/metrics/metrics.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_STRING)
				{
					String va= mycell.getStringCellValue();
					out.println(va);
				}
			}
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>

<html>
	<center>
			This is report
	</center>
</html>