<%@page import="java.sql.*,java.util.*"%>
<%
	String name = request.getParameter("cnm");
	int id = Integer.parseInt(request.getParameter("id"));
	int	 pass1 = Integer.parseInt(request.getParameter("pass"));
    double mob = Double.parseDouble(request.getParameter("mob"));
	float bal = Float.parseFloat(request.getParameter("bal"));
	int i =0;
	try
	{
		Connection con = null;
	Statement st = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
		//out.print(con);
		String qty = null;
		if(bal >= 5000){
					qty="INSERT INTO `customber` (`name`, `id`, `pass`, `mob`, `bal`) VALUES ('"+name+"', '"+id+"', '"+pass1+"', '"+mob+"', '"+bal+"') ";
					st = con.createStatement();
		st.executeUpdate(qty);
		//out.print(qty);
		//response.Redirect("index.jsp");
		i=1;
			session.setAttribute("id1", id);
           response.sendRedirect("Home.jsp"); 

			}
		else
		{
			out.print("Balance is less");
			 response.sendRedirect("registration.jsp"); 

		}
		
		//con = DriverManager.getConnection("jdbc:mysql://localhost:443/atm","root","");
		
	}
	catch(Exception e)
	{
		
				out.print("User is Already registread");

	}
	if(i!=0)
	{
		out.print("Registration is sucessful");
	}
	else
	{
					 response.sendRedirect("registration.jsp"); 

	}


%>