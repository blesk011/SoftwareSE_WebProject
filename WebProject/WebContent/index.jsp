<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!--
	main페이지
	로그인이 되어있지 않은 경우 접속하기를 통해 로그인, 회원가입이 가능. 로그인은 login.jsp로, 회원가입은 join.jsp로 이동.
	로그인이 되어있는 경우 마이 페이지를 통해 로그아웃 가능. UserLogoutServlet을 통해 session이 invalidate()됨.
	최종 수정: 2017/11/05
 -->
 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>메인 화면</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function logout(){
			var user_id = $('#user_id').val();
			$.ajax({
				type: 'POST',
				url: './UserLogoutServlet',
			})
		}
	</script>
</head>
<body>
	<%
		String session_id=null;
	
		if(session.getAttribute("user_id") !=null){
			session_id=(String)session.getAttribute("user_id");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">중고 장터</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			<%
				if(session_id == null){
				//-------------------------------------------------------로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">접속하기<span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 	<li><a href="login.jsp">로그인</a></li>
					 	<li><a href="join.jsp">회원가입</a></li>
					 </ul>
				</li>
			</ul>
			<% 
				} else{
				//-------------------------------------------------------로그인이 되어있는 경우
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">마이 페이지<span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 	<li><a href="" onclick="logout();">로그아웃</a></li>
					 </ul>
				</li>
			</ul>
			<%
				} 
			%>
		</div>
	</nav>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="/shoppingmall/css/style.css"/>

<div id="header">
  <div id="logo" class="box">
    <img class="noborder" id="logo" src="/shoppingmall/images/mollalogo3.png"/>
  </div>
  <div id="auth" class="box">
    <c:if test="${type == 0}"><!-- type값이 0이면 관리자코드로, 관리자용 로그인폼이 표시된다. -->
      <jsp:include page="mngr/logon/mLoginForm.jsp"/>
    </c:if>
    <c:if test="${type == 1}"><!-- type값이 1이면 사용자 코드로, 사용자용 로그인 폼이 표시된다. -->
      <jsp:include page="member/loginForm.jsp"/>
    </c:if>
  </div>
</div>
<!-- 템플릿 화면의 내용 부분이다. 
로직에서 응답한 페이지가 템플릿의 내용이 되며 이것은 Controller의 코드 130~줄정도의 request속성값으로 지정했다. 
이값은 템플릿인 index.jsp페이지로 넘겨져서 화면에 표시된다. 
cont변수에는 화면의 내용에 해당하는 페이지가 저장되어 있어서 <jsp:include>를 사용해서 화면에 표시된다. -->
<div id="content" class="box2">
  <jsp:include page="${cont}"/>
</div>
>>>>>>> master
