<%@page import="java.sql.*,java.util.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int	 pass1 = Integer.parseInt(request.getParameter("pass"));
	if(id != 0 && pass1 != 0)
	{
		try{
		Connection  conn = null;
		Statement st = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
		 PreparedStatement pst = conn.prepareStatement("Select * from customber where id = ? and pass= ?");
		pst.setInt(1, id);

		pst.setInt(2, pass1);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
        {
           out.println("Valid login credentials");
           session.setAttribute("id1", id);
           response.sendRedirect("Home.jsp");  

        }
        else
        {
           out.println("Invalid login credentials"); 
           response.sendRedirect("login.jsp");
        }
       }
       catch(Exception d)
       {
       	 out.println(d);
       }
	

	}
%>