<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개봉 영화 등록</title>
</head>
<body>
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

	<button onclick="insertMovie()">영화등록</button>
	<script>
		function insertMovie() {
			var inputs = document.querySelectorAll('input[name]');
			var params = '';
			for (var i = 0; i < inputs.length; i++) {
				var input = inputs[i];
				params += input.name + '=' + input.value + '&';
			}
			var xhr = new XMLHttpRequest();
			xhr.open('post', '/am/insert');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.response);
					alert(result.msg);
					if (result.url) {
						location.href = result.url;
					}
				}
			}
			xhr.send(params);
		}
	</script>
	<form method="get" action="/views/movie/ajax_list">
		<button>리스트로 돌아가기</button>
	</form>

</body>
</html>