<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ tag import="wedeal.bean.*" %>
<%@ tag import="java.util.*" %>

<!-- 글 생성 부분 -->
	<div class='container'>
		<div class='row'>
			<table class='table table-striped' style='border: 1px solid #dddddd' width='1000' height='600'>
				<thead>
					<tr>
						<th colspan='5' style='background-color: #eeeeee; text-align: center;' height='30'>인기글</th>
					</tr>
				</thead>
			 <tbody>
			 	<tr>
		<%
			BoardDBBean board = BoardDBBean.getinstance();
			ArrayList<BoardDataBean> list = board.AllgetList();
				for(int i = 0; i < 4; i++){//8개까지 보여줌
				String image = list.get(i).getBoard_image();
				String[] images = image.split("/");
		%>	
		<td align="center"><a href="view.jsp?board_num=<%=list.get(i).getBoard_num() %>&user_id=${user_id}"><%=list.get(i).getBoard_title().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a><%="<br>"%>
		<label>작성자:<%=list.get(i).getUser_id() %></label><%="<br>"%>
		<a href="view.jsp?board_num=<%=list.get(i).getBoard_num()%>&user_id=${user_id}"><img src="<%= list.get(i).getBoard_path() %>\<%= images[0] %>" height= 200px width=200px></a><%="<br>"%>
		<%=list.get(i).getBoard_date().substring(0,11) + list.get(i).getBoard_date().substring(11,13)+"시" + list.get(i).getBoard_date().substring(14,16)+"분"%></td>
	<%
		}
	%>
		</tr></tbody>
	<% if(request.getParameter("user_id") != null) {%>
		<thead>
					<tr>
						<th colspan='5' style='background-color: #eeeeee; text-align: center;' height='30'>추천글</th>
					</tr>
		</thead>
	<% } %>
		</table>
		</div>
	</div>