<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<%
	try
	{
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/ae.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		int k =sheet.getPhysicalNumberOfRows();
		System.out.println(k);
		for(int i=0;i<k;i++)
		{
			
			System.out.println(i);
		}
		
	}
	catch(Exception w)
	{
	}
%>
