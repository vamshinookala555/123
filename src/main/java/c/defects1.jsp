<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<Html>
	<head>
		<title> defects.... </title>
	</head>
	<body>
		<form name="f1" action=" " method="post">
<%
try
{
	int count=0,total=0;
	Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/ae.xls") );
	Sheet sheet = workbook.getSheetAt(0);
	int numofPhyrows =sheet.getPhysicalNumberOfRows();
	System.out.println(numofPhyrows);
	String name=(String)session.getAttribute("name");
	System.out.println(name);
	%>
			<table border=1>
	<%
	
	for (Row myrow1 : sheet) 
	{
			for (Cell mycell1 : myrow1)
			{
				if(mycell1.getCellType()==Cell.CELL_TYPE_STRING) 
				{
						String va= mycell1.getStringCellValue();
						if(va.equals("Assigned To"))
						{
							int r1= myrow1.getRowNum();
							int c1=mycell1.getColumnIndex();
							System.out.println(r1+ "    "+ c1);
							int temprow= r1;
							Row row2=null;
							Cell cell2=null;
							for(int i=0;i< numofPhyrows; i++)
							{
								temprow++;
								row2= sheet.getRow(temprow);
								cell2 = row2.getCell((c1));
								String s2= cell2.getStringCellValue();
								//out.println(s2);
								if(s2.equalsIgnoreCase(name))
								{
									Row row3=null;
									Cell cell3=null;
									//out.println("blha blha....");
									row3= sheet.getRow(temprow);
										for(int k=0; k<=7;k++)
										{
											cell3=row3.getCell(k);
											System.out.println(k);
											if(cell3.getCellType()==Cell.CELL_TYPE_NUMERIC) 
											{
											%>
												<tr>
													<td>
														<%out.print((int)cell3.getNumericCellValue()); %>
													</td>
											<%
											}
											if(cell3.getCellType()==Cell.CELL_TYPE_STRING) 
											{
												if(k==1)
												{
													%>
														<td width="500" >
														<%out.print(cell3.getStringCellValue()); %> 
														</td>
													<%
												}
												else{
												%>
												<td>
													<%out.print(cell3.getStringCellValue()); %>
												<td>
											<%
												}
											}
												if(k==6)
												{
												System.out.println("google");
												%>
												<td>
													<select name="defectstate" id="defectstate">
													<option value="Active"> Active/re-open </option>
													<option value="closed"> Closed </option>
													<option value="Verified"> Verified </option>
													<option value="Skipped"> Skipped </option>
												</td>
												<%
											}
											if(k==7)
											{
												
												%>
												<td>
													<input type="text">
												</td>
											</tr>
										</table>
								</form>
								<%
											}
										}
								}
							}
						
						}
				}
			}
	}
}
catch(Exception ex)
{
	 ex.printStackTrace();
}
%>
