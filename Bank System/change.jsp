<html>
<body>
<center>
<%
int id = (int) session.getAttribute("id1");
out.print("Set new Pin for the user "+id);
%>
<form action="update.jsp" method="post">
	<table>
				<tr>
					<td>Enter the Pin</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td></td><td><input type="reset" name="Clear" value="Clear"><input type="submit" name="submit" value="update"></td></tr>
				</table>
	</table>
</form>
</center>
</body>
</html>
