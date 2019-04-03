<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/movie/list"><button>영화개봉리스트</button></a>
<a href="/views/movie/ajax_list"><button>Ajax리스트가기</button></a><br>
<c:if test="${sessionScope.user==null}">
<form method="post" action="/user">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="ui_id" id="ui_id"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="ui_pwd" id="ui_pwd"></td>
	</tr>
	<tr>
		<td colspan="2"><button>로그인</button>
	</tr>
</table>
<input type="hidden" name="cmd" value="login">
</form>
<a href="/views/user/join"><button>회원가입</button></a>
</c:if>

<c:if test="${sessionScope.user!=null}">
<b>${sessionScope.user.uiName}님 반갑습니다.</b>
<form method="post" action="/user">
<input type="hidden" name="cmd" value="logout">
<button>로그아웃</button>
<!-- <a href="/views/list">리스트가기</a>
 -->
 
</form>
</c:if>
</body>
</html>