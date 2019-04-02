<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<table border="1">
	<tr>
			<th>번호</th>
			<th>영화명</th>
			<th>년도</th>
			<th>국가</th>
			<th>제작사</th>
			<th>감독</th>
		</tr>
	<tbody id="tbody">
	</tbody>

</table>
<body>
	<script>
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/am/${param.miNum}');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.response);
				var html = '';
				
					html += '<tr>'
					html += '<td>' + ${param.miNum} + '</td>';
					html += '<td>' + list['mi_name'] + '</td>';
					html += '<td>' + list['mi_year'] + '</td>';
					html += '<td>' + list['mi_national'] + '</td>';
					html += '<td>' + list['mi_vendor'] + '</td>';
					html += '<td>' + list['mi_director'] + '</td>';
					html += '</tr>'
				
				document.querySelector('#tbody').innerHTML = html;
			}
		}
		xhr.send();
	</script>
</body>
</html>