<%@ page import = "java.sql.*" %>
<%! String id, pass , columnValue, columnValue1,columnValue2,temp,temp1,admin; %>
<%! Integer flag; %>
<%     
		id=request.getParameter("login id").trim();
		pass=request.getParameter("password").trim();
		temp=request.getParameter("IsAdmin");
		System.out.println(id);
		//flag=0;
		try 
		{
			flag=0;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:metrics");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select Loginid, ResourceName, ID, IsAdmin from [Sheet1$]");
            while (rs.next())
            {
				//flag=0;
                    String columnValue =rs.getString(1);
					if(columnValue.equalsIgnoreCase(id))
					{
						System.out.println(columnValue);
						flag=1;
						String columnValue1 =rs.getString(3);
						
						if(columnValue1.equalsIgnoreCase(pass))
						{
							System.out.println(columnValue1);
							String columnValue2=rs.getString(2);
							session.setAttribute( "name", columnValue2 );
							flag++;
							admin=rs.getString(4);
							if(temp.equalsIgnoreCase(admin))
							{
								//session.setAttribute( "name", columnValue1 );
								flag++;
								if(admin.equals("T"))
									flag++;
							}	
						}	
					}
				
			}
			if(flag==3){
			 //flag=false;
			 
%>
            <jsp:include page="userhome.html"/>
<%
//break;
} 
else if(flag==4){
%>
           <jsp:include page="adminhome.html"/> 
		   
				

<%
}
else
{
%>
<HTML>
<HEAD>
</HEAD>
<body>
<BR></BR>
<br><br><h3><center><font color="red">You are Entering wrong Username and password and role.</font></center></h3>
            <jsp:include page="Login.html"/></body></HTML>
<%
//break;
}
            con.close();
 
        } catch (Exception ex) 
        {
            ex.printStackTrace();
        }
%>
