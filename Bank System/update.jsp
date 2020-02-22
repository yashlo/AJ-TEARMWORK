<html>
<body>
<%@ page import="java.sql.*,java.util.*"%>
<center>
<%
int id = (int) session.getAttribute("id1");
int	 pass1 = Integer.parseInt(request.getParameter("pass"));
int i = 0;
try{
	  Connection con = null;
	Statement st = null;

			Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
	  PreparedStatement pst1 = con.prepareStatement("update customber set pass = ? where id = ?");
              pst1.setInt(1,pass1);
              pst1.setInt(2, id);
       		  pst1.executeUpdate();
       		  
       		  i = 1;


}
 catch(Exception e)
      {
      	out.print(e);
      }
 if(i == 1)
 {
 	out.print("Password Updated Suucessfully"); 
 }
 else
 {
 	out.print("Password not Updated Suucessfully"); 
 }

%>
</center>
</body>
</html>