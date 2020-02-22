<html>
<body>
<center>
<%
	int id = (int) session.getAttribute("id1");
	out.print("Welcome "+id+"<br>");
	out.print("Select your choice"+"<br>");
	out.print("1-Credit Money"+"<br>");
	out.print("2-Debit Money"+"<br>");
	out.print("3- Check Balance "+"<br>");
	out.print("4-Change the Pin "+"<BR>");
	out.print("5-Exit the transaction "+"<BR>");
%>
<form action="traction.jsp" method ="post">
	<table>
		<tr>
			<td>Enter the Amount</td>
			<td><input type="text" name="bal"></td>
		</tr>
		<tr>
			<td>Selct your choice</td>
			<td><input type="text"  name="ch"></td>
		</tr>
		<tr>
			<td></td><td><input type="reset" name="Clear" value="Clear"><input type="submit" name="submit" value="Submit"></td>
		</tr>

	</table>
</center>

</form>
</body>
</html>
