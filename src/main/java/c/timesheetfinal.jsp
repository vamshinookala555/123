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
<%! Integer  nfrow,nfcell; %>
<%
	try
	{
		String fname=(String)session.getAttribute("name");
		int flag=0;
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/timesheet.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_STRING) 
				{
					name= mycell.getStringCellValue();
					if(name.equals("Name"))
					{
						int r1= myrow.getRowNum();
						int c1=mycell.getColumnIndex();
						int r2=r1;
						Row nrow;
						Cell ncell;
						do
						{
							 r2++;
							 nrow=sheet.getRow((r2));
							 ncell=nrow.getCell(c1);
							String s2= ncell.getStringCellValue();
							//System.out.println(s2);
							if(s2.equals(fname))
							{
								nfrow=nrow.getRowNum();
								nfcell=ncell.getColumnIndex();
							}
						}while(!((ncell.getStringCellValue()).equalsIgnoreCase("Total")));
					}
				}
			}
		}
		for (Row myrow : sheet) 
		{
			for (Cell mycell : myrow)
			{
				if(mycell.getCellType()==Cell.CELL_TYPE_STRING) 
				{
					String va= mycell.getStringCellValue();
					String team1=request.getParameter("projects");
					//System.out.println("Input from User" + team1);
					if(va.equals(team1))
					{	
						System.out.println(va);
						//System.out.println("Vamsi");
						int r1= myrow.getRowNum();
						int c1=mycell.getColumnIndex();
						System.out.println(r1+"    " +c1);
						int temprow=r1+1;
						Row temprow1= sheet.getRow(temprow);
						String type1=request.getParameter("type1");
						Cell tempcell1=null;
						if(type1.equals("Project Hours"))
						{
							tempcell1 = temprow1.getCell((c1));
						}
						if(type1.equals("Non Project Hours"))
						{
							tempcell1 = temprow1.getCell((c1+1));
						}
						
						String type2=tempcell1.getStringCellValue();
						System.out.println(type2);
						if(type1.equals(type2))
						{
							int r2= temprow1.getRowNum();
							int c2=tempcell1.getColumnIndex();
							System.out.println("internal" +r2+"   " + c2);
							System.out.println("Name" + nfrow+ "   " +nfcell);
							Row finalrow=sheet.getRow(nfrow);
							Cell finalcell=finalrow.getCell(c2);
							float f=(Float.parseFloat(request.getParameter("hours").trim()));
							System.out.println(f);
							finalcell.setCellValue(f);
						}
					}
				}
				
				if(flag==1)
				{
					break;
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
			String query="update [Sheet1$] set timesheet='updated' where ResourceName='";
			String fquery=query.concat(fname + "'");
			System.out.print(fquery+ " timesheet updated");
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
			alert("You have successfully submitted your Time Sheet");
			
		}
	</script>
</head>
<body onload="sucess()">
<jsp:include page="timesheet.jsp"/>
</body>
	
</Html>