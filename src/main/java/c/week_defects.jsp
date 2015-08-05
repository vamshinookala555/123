<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.hsmf.MAPIMessage" %>
<%@ page import= "org.apache.poi.hsmf.datatypes.AttachmentChunks" %> 
<%@ page import= "org.apache.poi.hsmf.exceptions.ChunkNotFoundException" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%! String fileNameStem, filename1,body; %>
<%! String id, pass ,name,columnValue, columnValue1, s2; %>
<%! MAPIMessage msg; %>
<%! int inval=0, reopen=0, veri=0; %>
<%!String fproject=null;  %>
<%!String defectstatus[]={"","Invalid","Re-Open","Verified"};  %>
<%!String tokens[]={"","Active", "Verified","Closed","Skipped","Working Fine"};  %>
<%!String Project[]={"","Developer","AE", "SYM", "ACRM", "C & W" , "DCFX" , "Developer Budget"};  %>
<%! int flag=0;  %>
<Html>
<head>
	<style>
			body{
				background-color:#555555;
				color:whitesmoke;
			}
			table{
			color: palegreen; border-color: black;
			}
	</style>
</head>
	<body>
	<center>
		<h2> You have successfully updated defect state for the week. </h2>
			<h3> updated values are as follows: </h3>
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
							if(va.equals("Product Name"))
							{
								int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								System.out.println(r1+ "    "+ c1);
								int tempcol=c1+1;
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("Invalid"))
								{
								%>
								<table  border="1" cellpadding="10" >
								<th> Product Name </th>
								<th> Invalid </th>
								<th> Re-open </th>
								<th> Verified </th>
								<th> Total </th>
								<%
									int rows=r1;
									for(int i=1; i<=Project.length; i++)
									{
										rows++;
										Row proj= sheet.getRow((rows));
										Cell projval = proj.getCell((c1));
								%>
								
									<tr>
									<td>
										<% out.print(projval.getStringCellValue()); %> 
									</td>
									<%
										for(int n=1; n<=defectstatus.length; n++)
										{
											Cell stateval=proj.getCell(c1+n);
									%>
										<td>
											<%  out.print(stateval.getNumericCellValue()); %> 
										</td>
								
									<%
										}
									%>
									</br>
									<%
									}
								}
							}
						}
					}
				}
						FileOutputStream fileOut = new FileOutputStream("C:/Program Files/Apache Software Foundation/apache-tomcat-7.0.42/webapps/metrics/metrics.xls");
				workbook.write(fileOut);
				fileOut.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
	</tr>
	</table>
	</center>	
	</body>
</Html>
