<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/user">
		<table border="1">
			<tr>
				<th>User Id :</th>
				<td><input type="text" name="ui_id" id="ui_id"></td>
			</tr>
			<tr>
				<th>User PWD :</th>
				<td><input type="password" name="ui_pwd" id="ui_pwd"></td>
			</tr>
			<tr>
				<th>User Name :</th>
				<td><input type="text" name="ui_name" id="ui_name"></td>
			</tr>
			<tr>
				<th>User Email :</th>
				<td><input type="text" name="ui_email" id="ui_email"></td>
			</tr>
			<tr>
				<td colspan="2"><button>회원가입</button></td>
			</tr>
		</table>
		<input type="hidden" name="cmd" value="insert">
	</form>
</body>
</html>