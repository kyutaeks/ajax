<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var config = {
			name : '홍길동',
			info : function() {
				alert('인포테이션!');
			}
		}
		config.info();
		console.log(config.name);
		config.test = function(){
			alert('나도 됨!');
			
		}
		config.test();
		  config.toString = function(){
			return '난 출력하면 이제 이게 나옴!'; 
			
		 }  
		alert(config);
		
	</script>
</body>
</html>