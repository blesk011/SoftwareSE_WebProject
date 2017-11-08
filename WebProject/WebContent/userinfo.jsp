<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="user.userDAO"%>
<!-- ������ ���� �Լ� -->
<%@ page import="user.userDTO"%>
<!-- ���� ��ü -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>ȸ�� ���� ��ȸ</title>
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
<jsp:useBean id="user" class="user.userDAO" scope="session" />
</head>

<body>
	<%
		String session_id = null;
		
		if(session.getAttribute("user_id")!=null){
			session_id = (String)session.getAttribute("user_id");
		}
		
		userDTO userinfo = user.getUser(session_id);
		
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">WeDEAL</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">����</a></li>
				<li><a href="board.jsp">�Խ���</a></li>
			</ul>
			<%
				if(session_id == null){
				//-------------------------------------------------------�α����� �Ǿ����� ���� ���
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 	<li><a href="login.jsp">�α���</a></li>
					 	<li><a href="join.jsp">ȸ������</a></li>
					 </ul>
				</li>
			</ul>
			<% 
				} else{
				//-------------------------------------------------------�α����� �Ǿ��ִ� ���
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����<span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 	<li><a href="" onclick="logout();">�α׾ƿ�</a></li>
					 	<li><a href="info/userinfo.jsp" >�� ����</a></li>
					 </ul>
				</li>
			</ul>
			<%
				} 
			%>
		</div>
	<!-- ȸ�� �޴� -->
	</nav>
	<div id="menu" style="display:inline-block; border-right:1px solid; float:left; height:400px; width:15%; padding:10px;">
		<ul style="list-style:none;">
			<li><a href="#">�� �Խñ�</a></li>
			<li><a href="#">�� ���</a></li>
			<li><a href="#">�� ��</a></li>
		</ul>
	</div>
	
	<!-- ȸ�� ���� ��ȸ �� ����-->
	<div class="userinfo" style="float:left;">
		<div id="profile" style="display:inline-block; border:1px; height:200px; width:500px; padding-left:50px; padding-right:50px;">
			<h3>WeDEAL ������</h3>
			<hr>
			<div>
				<form name="mod" method="post" action="">
				<table>
					<tr>
						<td>�̸� : </td>
						<td><%=userinfo.getUser_name() %></td>
					</tr>
					<tr>
						<td>���ɴ� : </td>
						<td><%=userinfo.getUser_age() %></td>
					</tr>
					<tr>
						<td><input type="submit" name="Submit" value="����"></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		
		<div id="contact" style="display:inline-block; border:1px; height:200px; width:500px; padding-left:50px; padding-right:50px;">
			<h3>����ó</h3>
			<hr>
			<div>
				<form name="mod" method="post" action="">
				<table>
					<tr>
						<td>�޴���ȭ : </td>
						<td><%=userinfo.getUser_phone() %></td>
					</tr>
					<tr>
						<td><input type="submit" name="Submit" value="����"></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		<br>
		
		<div id="secret" style="display:inline-block; border:1px ; float:bottom; height:200px; width:500px; padding-left:50px; padding-right:50px;">
			<h3>��й�ȣ</h3>
			<hr>
			<div>
				<form name="mod" method="post" action="">
				<table>
					<tr>
						<td><input type="submit" name="Submit" value="����"></td>
					</tr>	
				</table>
				</form>
			</div>
		</div>
		
		<div id="withdraw" style="display:inline-block; border:1px; height:200px; width:500px; padding-left:50px; padding-right:50px;">
			<h3>ȸ�� Ż��</h3>
			<hr>
			<div>
				<form name="leave" method="post" action="">
				<table>
					<tr>
						<td><input type="submit" name="Submit" value="Ż��" ></td>
				</table>
				</form>
			</div>
		</div>
		
	</div>
		



</body>
</html>