<%@ page language="java" contentType="text/html" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*,javax.activation.*" %>

<%
String result;
ArrayList<String> content = new ArrayList<String>(); 
String from="vamshi.nookala@valuelabs.net";
String email = request.getParameter("mailto");
System.out.println(email);
String filepath= request.getParameter("hd1");
System.out.println(filepath);
String cc = request.getParameter("cc");
//System.out.println(cc);
StringTokenizer st2 = new StringTokenizer(cc);
content.clear();
while (st2.hasMoreElements()) 
{
	String s= st2.nextElement().toString();
	content.add(s);
}
String subject= request.getParameter("subject");
String body=request.getParameter("body");
Properties props = new Properties();
props.put("mail.smtp.host", "mx.valuelabs.net");
Session s = Session.getInstance(props);
Vector error = new Vector();
MimeMessage message = new MimeMessage(s);
InternetAddress from1 = new InternetAddress(from);
message.setFrom(from1);  
if(email.indexOf("@") >0 && email.indexOf(".", email.indexOf("@"))!=-1) {
	try{
		InternetAddress to =new InternetAddress(email);
        message.addRecipient(Message.RecipientType.TO, to);
      }
      catch(AddressException e){
        error.addElement(new String("Your email address isn't valid"));
      }
  }
InternetAddress[] addressTo = new InternetAddress[content.size()];
for (int i = 0; i < content.size(); i++)
{
	String adcc=content.get(i);
    addressTo[i] = new InternetAddress(adcc);
}
message.setRecipients(Message.RecipientType.CC, addressTo); 
message.setSubject(subject);
try{
	BodyPart messageBodyPart = new MimeBodyPart();
	messageBodyPart.setText(body);
	String filename ="C:/Program Files (x86)/apache-tomcat-7.0.54/webapps/metrics/metrics.xls";
	Multipart multipart = new MimeMultipart();
	multipart.addBodyPart(messageBodyPart);
	MimeBodyPart attachPart = new MimeBodyPart();
	attachPart.attachFile(filename);
	multipart.addBodyPart(attachPart);
	message.setContent(multipart);
	result = "Message sent successfully";
}
catch(Exception e){
	error.addElement("Some thing Gone wrong");
	result = "Error: unable to send message....";
	e.printStackTrace();
}
if (error.size() < 1){
   Transport.send(message);
}
 %>
 <Html>
	<body>
		<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</body>
</html>