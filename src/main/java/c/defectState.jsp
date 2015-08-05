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
<%!String Project[]={"","Developer", "ARGUS-DCF", "AE", "C&W", "SYM", "ACRM", "ARGUS Express" "Developer Budget"};  %>
<%! int flag=0;  %>
<%!
public void listFilesForFolder(File folder) 
{
    for (File fileEntry : folder.listFiles()) 
	{
        if (fileEntry.isDirectory()) 
		{
            listFilesForFolder(fileEntry);
        } 
		else 
		{
			String tokens[]={"","Active", "Verified","Closed","Skipped","Working Fine"};
			try
			{
				filename1 =(fileEntry.getName());
				if(filename1.endsWith(".msg")|| filename1.endsWith(".MSG"))
				{
					body=" ";
					System.out.println(filename1);
					String filepath="C:/Metrics/msg files/";
					String ffinal=filepath.concat(filename1);
					msg = new MAPIMessage(ffinal);
					body= msg.getTextBody();
					//System.out.println(body);
					processMessage(body);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
        }
    }
}
public void processMessage(String body)
{
	ArrayList<String> content = new ArrayList<String>(); 
	try{
	
	Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls") );
	Sheet sheet = workbook.getSheetAt(0);
		StringTokenizer st2 = new StringTokenizer(body.toString());
		content.clear();
						//int k=0;
						while (st2.hasMoreElements()) 
						{
							String s= st2.nextElement().toString();
							content.add(s);
						}
						//int veri=0,reopen=0, inval=0;
						for(int j=0;j<content.size();j=j+1)
						{
							String item=content.get(j);
							//System.out.println(j+"" +item);
							for(int f=1;f<Project.length; f++)
							{
								if(Project[f].equalsIgnoreCase(item.trim()))
								{
									fproject=item;
									System.out.println(fproject);
								}
							}
							for(int k=1;k<tokens.length;k++)
							if(tokens[k].equalsIgnoreCase(item.trim()))
							{
								//System.out.println(tokens[k] + " " + item.trim());
								//System.out.println(content.get(j+1));
								//inval=Integer.parseInt(content.get(j+1));
								switch(k)
								{	
									case 1: reopen=Integer.parseInt(content.get(j+1));
											//System.out.println(reopen);
											break;
									case 2: veri= Integer.parseInt(content.get(j+1));
											//System.out.println(verify);
											break;
									case 3: inval= Integer.parseInt(content.get(j+1));
											//System.out.println(inval);
											break;
								}
							}
							//ac[k]=(Integer.parseInt(item.trim()));
							//System.out.println(ac[k]);
							//k++;
				
						}
						System.out.println(reopen + "   " + veri + "  " + inval);
	//out.println("Successfully completed"); 
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
									//System.out.println("asdfdafdsfsd");
									for(int i=1; i<defectstatus.length; i++)
									{
										int col=c1+i;
										Row row1= sheet.getRow(r1);
										Cell cell1 = row1.getCell((col));
										//System.out.println(col);
										String va1= cell1.getStringCellValue();
										//out.println(va1);
										if(va1.equalsIgnoreCase(defectstatus[i])) //(String)session.getAttribute("name")
										{
											//System.out.println(defectstatus[i] + "     " + va1);
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
												//System.out.println(s2);
												//String project="AE";
												if(((s2.trim()).equalsIgnoreCase(fproject)))
												{
													System.out.println(s2);
													Cell finalcell;
													int m;
													switch(i)
													{
														case 1:
																	 finalcell=row2.getCell(c1+i);
																	 m=(int)finalcell.getNumericCellValue();
																	finalcell.setCellValue(m+inval);
																	break;
														case 2:
																	 finalcell=row2.getCell(c1+i);
																	 m=(int)finalcell.getNumericCellValue();
																	finalcell.setCellValue(m+reopen);
																	break;
														case 3:
																	finalcell=row2.getCell(c1+i);
																	 m=(int)finalcell.getNumericCellValue();
																	finalcell.setCellValue(m+veri);
																	break;
													}
													//Cell finalcell=row2.getCell(c1+i);
													//finalcell.setCellValue(verify);
													//flag=1;
												}
											}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
									
										}	
									}
								}
					}
				}
			}
			if(flag==1)
			break;
		}
		
		workbook.getCreationHelper().createFormulaEvaluator().evaluateAll();
		FileOutputStream fileOut = new FileOutputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls");
		workbook.write(fileOut);
		fileOut.close();
	}
	catch(Exception e){
	e.printStackTrace();
	}
}
%>
<%
try
{
	File folder = new File("C:/Metrics/msg files");
	listFilesForFolder(folder);
}
catch(Exception e)
{
	e.printStackTrace();
	
}
%>	

 <jsp:include page="week_defects.jsp"/>

