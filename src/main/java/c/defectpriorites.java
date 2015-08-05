package metrics;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.io.FileInputStream;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.WorkbookFactory;
 
 class defectpriorites
 {
	String id, pass ,name,columnValue, columnValue1, s2; 
	
	public void setpriorites()
	{
	try
	{
		String priorites[]={"","P1-NOW","P2-HIGH","P3-MEDIUM","P4-LOW"};
		String priorites1[]={"","p1","p2","p3","p4"};
		name=(String)session.getAttribute("name");
		Workbook workbook= WorkbookFactory.create(new FileInputStream("C:/Program Files/Apache Software Foundation/apache-tomcat-7.0.42/webapps/metrics/metrics.xls") );
		Sheet sheet = workbook.getSheetAt(0);
		int flag=0;
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
								System.out.println(r1+ "    "+ c1);
								int tempcol=c1+1;
				
								Row temprow1= sheet.getRow(r1);
								Cell tempcell1 = temprow1.getCell((tempcol));
								if((tempcell1.getStringCellValue()).equalsIgnoreCase("P1-NOW"))
								
							for(int i=1; i<priorites.length; i++)
							{
								int col=c1+i;
				
								Row row1= sheet.getRow(r1);
								Cell cell1 = row1.getCell((col));
								System.out.println(col);
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
											//out.println(cell2.getStringCellValue());
											//out.println(priorites[i]);
											Cell finalcell=row2.getCell(c1+i);
											//String getbyname="p";
											finalcell.setCellValue((Integer.parseInt(request.getParameter(priorites1[i]).trim())));
											//finalcell.setCellValue(10);
											//out.println(finalcell.getNumericCellValue());
											flag=1;
										}
									}while(!((cell2.getStringCellValue()).equalsIgnoreCase("Total")));
									
								}
							}
						}
						//System.exit(0);	
				}
			
					//System.out.println(mycell.getCellValue());
			}
		}
 
      workbook.getCreationHelper().createFormulaEvaluator().evaluateAll();
      FileOutputStream fileOut = new FileOutputStream("C:/Program Files/Apache Software Foundation/apache-tomcat-7.0.42/webapps/metrics/metrics.xls");
      workbook.write(fileOut);
      fileOut.close();
    }
	}
    catch (Exception ex) 
    {
            System.err.print("Exception: ");
            System.err.println(ex.getMessage());
    }
}
	
