<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<%!String packetstatus[]={"","re-open", "verified"};  %>
<%! String s2; %>
<%! int flag=0;  %>
<%
try
{	
	Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls") );
	Sheet sheet = workbook.getSheetAt(0);
	String team= request.getParameter("project"); 
	System.out.println(team);
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_STRING) 
				{
					String va= mycell.getStringCellValue();
					if(va.equals("Product Name"))
					{
								int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								System.out.println(r1+ "    "+ c1);
								int tempcol=c1+1;
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("re-open"))
								{
									for(int i=1; i<packetstatus.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										String va1= cell1.getStringCellValue();
										System.out.println(va1);
										if(va1.equalsIgnoreCase(packetstatus[i])) 
										{

											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//System.out.println(s2);
												if(((s2.trim()).equalsIgnoreCase(team)))
												{
													//System.out.println("fsdfwe");
													Cell finalcell=row2.getCell(c1+i);
													int d=(int)finalcell.getNumericCellValue();
													System.out.println(d);
													int f=(Integer.parseInt(request.getParameter(packetstatus[i])));
													System.out.println(f);
													finalcell.setCellValue((f+d));
													flag=1;
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
									
										}	
									}
								}
					}
				}
							if(flag==1)
								break;
			}

		}
		
		workbook.getCreationHelper().createFormulaEvaluator().evaluateAll();
		FileOutputStream fileOut = new FileOutputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls");
		workbook.write(fileOut);
		fileOut.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<html>
<head>
	<style>
		body{
				background-color:#555555;
				color:whitesmoke;
				text-align:center;
			}
	</style>
</head>
	<body>
		<h2>You have submitted Packet regression status successfully </h2>
	</body>
</html>