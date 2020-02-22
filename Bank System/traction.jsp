<body>
<center>
<%@page import="java.sql.*,java.util.*"%>
<%
	float bal1 = Float.parseFloat(request.getParameter("bal"));
	float bal2=0.00f,aft=0.00f;

	Connection con = null;
	Statement st = null;
//	int chao = Integer.parseInt(request.getParameter("cho"));
	String cho = request.getParameter("ch");
	out.print(cho);
	int id = (int) session.getAttribute("id1");
	out.print("");
	if(cho.equals("1"))
	{
		out.print("Credit Money <br>");
		try{

			Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
		 PreparedStatement pst = con.prepareStatement("Select * from customber where id = ?");
		pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	bal2 = rs.getFloat(5);
        }
        out.print("Balance before transaction&nbsp"+bal2+"<br>");
       
        if(bal2 - bal1 < 5000)
        {
        	  out.print("Less Balance <br>");
        }
        else
        {
              PreparedStatement pst1 = con.prepareStatement("update customber set bal = ? where id = ?");
              aft = bal2 - bal1 ;
              pst1.setFloat(1,aft);
              pst1.setInt(2, id);
       		  pst1.executeUpdate();

        	 

        }
      
        out.print("Balance after the transaction&nbsp"+aft);
        //response.sendRedirect("Home.jsp");
      }
      catch(Exception e)
      {
      	out.print(e);
      }  
	}
	if(cho.equals("2"))
	{
		out.print("Debit Money <BR>");
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
		 PreparedStatement pst = con.prepareStatement("Select * from customber where id = ?");
		pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        while(rs.next())	
        {
        	bal2 = rs.getFloat(5);
        }
        out.print("Balance before transaction&nbsp"+bal2+"<br>");
              PreparedStatement pst1 = con.prepareStatement("update customber set bal = ? where id = ?");
              aft = bal2 + bal1 ;
              pst1.setFloat(1,aft);
              pst1.setInt(2, id);
       		  pst1.executeUpdate();
      
        out.print("Balance after the transaction&nbsp"+aft);

	}
	catch(Exception e)
	{
		out.print(e);
	}
		
       //response.sendRedirect("Home.jsp");
	}
	if(cho.equals("3"))
	{
		//out.print("Balance is");
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm","root","");
		 PreparedStatement pst = con.prepareStatement("Select * from customber where id = ?");
		pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        while(rs.next())	
        {
        	bal2 = rs.getFloat(5);
        }
        out.print("Current Balance &nbsp"+bal2+"<br>");
    }
	catch(Exception e)
	{
		out.println(e);
	}

	}
	if(cho.equals("4"))
	{
		out.print("Change Pin");
		response.sendRedirect("change.jsp");
	}
	if(cho.equals("5"))
	{
		 response.sendRedirect("login.jsp");
	}


%>