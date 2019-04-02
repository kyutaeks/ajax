<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개봉 영화 등록</title>
</head>
<body>
	<form method="post" action="/movie/insert">
		<table border="1">
			<tr>
				<th>영화제목 :</th>
				<td><input type="text" name="mi_name"></td>
			</tr>
			<tr> 
				<th>제작년도 :</th>
				<td><input type="text" name="mi_year"><br></td>
			</tr>
			<tr>
				<th>국가 :</th>
				<td><input type="text" name="mi_national"><br></td>
			</tr>
			<tr>
				<th>제작사 :</th>
				<td><input type="text" name="mi_vendor"><br></td>
			</tr>
			<tr>
				<th>영화감독 :</th>
				<td><input type="text" name="mi_director"><br></td>
			</tr>
		</table>

		<button>영화등록</button>
	</form>
	<form method="get" action="/movie/list">
		<button>리스트로 돌아가기</button>
	</form>

</body>
</html>