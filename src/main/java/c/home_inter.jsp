<%@ page import = "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.FileInputStream" %>
<%@ page import= "org.apache.poi.ss.usermodel.*" %>
<%@ page import= "org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import= "org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.lang.*" %>
<%! String id, pass ,name,columnValue, columnValue1, s2,team,query, fquery; %>
<%
	try
	{
		String priorites[]={"","P1-NOW","P2-HIGH","P3-MEDIUM","P4-LOW"};
		String priorites1[]={"","p1","p2","p3","p4"};
		String types[]={"","User Interface","Functional", "Calculation", "Validation", "Navigation"};
		String types1[]={"", "ui","fun","calc","val","nav"};
		name=(String)session.getAttribute("name");
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		int flag=0;
		 team= request.getParameter("team"); //request.getParameter("project");
		System.out.println(team);
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_STRING) 
				{
					//case Cell.CELL_TYPE_STRING:
						String va= mycell.getStringCellValue();
						if(va.equals("Resource Name"))
						{
								int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								//System.out.println(r1+ "    "+ c1);
								int tempcol=c1+1;
				
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("P1-NOW"))
								{
									for(int i=1; i<priorites.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										//System.out.println(col);
										String va1= cell1.getStringCellValue();
										//out.println(va1);
										if(va1.equalsIgnoreCase(priorites[i])) //(String)session.getAttribute("name")
										{
											//out.println(name);
											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//out.println(s2);
												if(s2.equalsIgnoreCase(name))
												{
													Cell finalcell=row2.getCell(c1+i);
													int d=(int)finalcell.getNumericCellValue();
													int f=(Integer.parseInt(request.getParameter(priorites1[i]).trim()));
													finalcell.setCellValue((f+d));
													flag=1;
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
									
										}	
									}
								}
								//"for types of bugs
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("User Interface"))
								{
									for(int i=1; i<types.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										//System.out.println(col);
										String va1= cell1.getStringCellValue();
										//out.println(va1);
										if(va1.equalsIgnoreCase(types[i])) //(String)session.getAttribute("name")
										{
											//out.println(name);
											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//out.println(s2);
												if(s2.equalsIgnoreCase(name))
												{
													Cell finalcell=row2.getCell(c1+i);
													int d=(int)finalcell.getNumericCellValue();
													int f=(Integer.parseInt(request.getParameter(types1[i]).trim()));
													finalcell.setCellValue((f+d));
													//finalcell.setCellValue((Integer.parseInt(request.getParameter(types1[i]).trim())));
													flag=1;
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
									
										}	
									}
								}
								//"for total.
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("No. of Defects logged"))
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
												//out.println(s2);
												if(s2.equalsIgnoreCase(name))
												{
													Cell finalcell=row2.getCell(c1+1);
													//String getbyname="p";
													int d=(int)finalcell.getNumericCellValue();
													int f=(Integer.parseInt(request.getParameter("total")));
													finalcell.setCellValue((f+d));
													//finalcell.setCellValue((Integer.parseInt(request.getParameter("total"))));
													//finalcell.setCellValue(10);
													//out.println(finalcell.getNumericCellValue());
													flag=1;
													
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));	
								}
								
						}
						//for writing team metrics.
						if(va.equals("Product Name"))
						{
									int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								//System.out.println(r1+ "    "+ c1);
								int tempcol=c1+1;
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								//System.out.println(tempcell1.getStringCellValue());
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("No. of Defects"))
								{
											//out.println(name);
											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//out.println(s2);
												if((s2.equalsIgnoreCase(team)))
												{
													System.out.println(team);
													Cell finalcell=row2.getCell(c1+1);
													int d=(int)finalcell.getNumericCellValue();
													//int t=Integer.parseInt(d);
													int f=(Integer.parseInt(request.getParameter("total")));
													finalcell.setCellValue((f+d));
													//out.println(f+d);
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
										
								}
						}
						if(va.equals("Priority"))
						{	
								int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								//System.out.println(r1+ "   " + c1);
								int tempcol=c1+1;
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("P1-Now"))
								{
									for(int i=1; i<priorites.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										//System.out.println(col);
										String va1= cell1.getStringCellValue();
										//out.println(va1);
										if(va1.equalsIgnoreCase(priorites[i])) //(String)session.getAttribute("name")
										{
											//out.println(priorites[i]);
											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//out.println(s2);
												if((s2.equalsIgnoreCase(team)))
												{
													Cell finalcell=row2.getCell(c1+i);
													int d=(int)finalcell.getNumericCellValue();
													//out.println(i);
													//int t=Integer.parseInt(d);
													int f=(Integer.parseInt(request.getParameter(priorites1[i]).trim()));
													finalcell.setCellValue((f+d));
													//out.println(f+d);
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
										}
									}
								}
						}	
						
						//"team defect types.
						if(va.equals("Defect Type"))
						{	
								int r1= myrow.getRowNum();
								int c1=mycell.getColumnIndex();
								//System.out.println(r1+ "   " + c1);
								int tempcol=c1+1;
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("User Interface"))
								{
									for(int i=1; i<types.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										//System.out.println(col);
										String va1= cell1.getStringCellValue();
										//out.println(va1);
										if(va1.equalsIgnoreCase(types[i])) //(String)session.getAttribute("name")
										{
											//out.println(priorites[i]);
											int rows=r1;
											Row row2=null;
											Cell cell2=null;
											do
											{
												rows++;
												row2= sheet.getRow(rows);
												cell2 = row2.getCell((c1));
												s2= cell2.getStringCellValue();
												//out.println(s2);
												if((s2.equalsIgnoreCase(team)))
												{
													Cell finalcell=row2.getCell(c1+i);
													int d=(int)finalcell.getNumericCellValue();
													int f=(Integer.parseInt(request.getParameter(types1[i]).trim()));
													finalcell.setCellValue((f+d));
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
										}
									}
								}
						}
						
				}
			
					//System.out.println(mycell.getCellValue());
					if(flag==1)
						break;
			}
		}
 
				workbook.getCreationHelper().createFormulaEvaluator().evaluateAll();
				FileOutputStream fileOut = new FileOutputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls");
				workbook.write(fileOut);
				fileOut.close();
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:metrics");
            Statement st = con.createStatement();
			String query="update [Sheet1$] set status='updated' where ResourceName='";
			String fquery=query.concat(name + "'");
			System.out.print(fquery);
			st.executeUpdate(fquery);
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
		background: #555555;
		color: whitesmoke;
		text-align:center;
		}
	</style>
	<script>
		function sucess()
		{
			alert("You have successfully submitted your weekly defects");
			
		}
	</script>
</head>
<body onload="sucess()">
<jsp:include page="general.jsp"/>
</body>
	
</Html>

