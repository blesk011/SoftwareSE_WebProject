<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="wedeal.bean.*" %>
<!-- 
	로그인 페이지
	ID/PW를 입력했을떄 DB에 정보가 존재할 경우 로그인 성공
	ID/PW중 하나라도 틀리거나, 적지 않은 경우에는 UserLoginServlet에서 session에 경고메세지를 담아 보내고, login.jsp에서 경고 메세지 출력
	로그인 성공할 경우 main페이지로 이동(로그인 한 상태에서)
	로그인한 회원의 정보는 session으로 유지
	최종 수정: 2017/11/05
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>댓글 수정</title>
	<script type="text/javascript">
		function logout(){
			var user_id = $('#user_id').val();
			$.ajax({
				type: 'POST',
				url: '/newWebProject/UserLogoutServlet',
			})
		}
	</script>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="Menubar.jsp"/>
	<% int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	   int board_num = Integer.parseInt(request.getParameter("board_num"));
	   CommentDBBean comment = CommentDBBean.getinstance();
	   CommentDataBean commentdt = comment.getComment(comment_num);
	%>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/newWebProject/CommentUpdateAction">
					<h3 style="text-align: center;">댓글 수정</h3>
					<div class="form-group">
						<textarea class="form-control" name="comment_content" style="height: 100px;"><%=commentdt.getComment_content()%></textarea>
					</div>
					<input type="hidden" name="board_num" value=<%=board_num %>>
					<input type="hidden" name="comment_num" value=<%=comment_num %>>
					<input type="submit" class="btn btn-primary form-control" value="수정">
				</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
	</div>
	
</body>
</html>