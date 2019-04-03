<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화개봉리스트</title>
</head>
<body>
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
	<c:if test="${sessionScope.user!=null}">
		<a href="/views/movie/ajax_insert"><button>개봉 영화 등록</button></a>
	</c:if>
	<script>
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/am/list');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.response);
				var html = '';
				for (var i = 0; i < list.length; i++) {
					html += '<tr onmouseover="this.style.backgroundColor=\'yellow\'"';
					html += ' onmouseout="this.style.backgroundColor=\'\'"';
					html += ' onclick="goPage(' + list[i]['mi_num'] + ')">';
					html += '<td>' + list[i]['mi_num'] + '</td>';
					html += '<td>' + list[i]['mi_name'] + '</td>';
					html += '<td>' + list[i]['mi_year'] + '</td>';
					html += '<td>' + list[i]['mi_national'] + '</td>';
					html += '<td>' + list[i]['mi_vendor'] + '</td>';
					html += '<td>' + list[i]['mi_director'] + '</td>';
					html += '</tr>'
				}
				document.querySelector('#tbody').innerHTML = html;
				//#은 id 그리고 tbody태그 안에 넣으라는 innerHTML
			}
		}
		xhr.send();
		function goPage(miNum) { 
			location.href = '/views/movie/ajax_view?miNum=' + miNum;
		}
	</script>
	<form method="post" action="/"><button>처음</button></form>
</body>
</html>

