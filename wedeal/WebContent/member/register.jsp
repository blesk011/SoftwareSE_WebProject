<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script src="/wedeal/js/jquery-1.11.0.min.js"></script>
	<title>ȸ������</title>
	<script type="text/javascript">
		function registerCheckFunction(){
			var user_id = $('#user_id').val();
			$.ajax({
				type: 'POST',
				url: './ConfirmIdAction',
				data: {user_id: user_id},
				success: function(result){
					if(result == 1)
						alert("����� �� �ִ� ���̵��Դϴ�.");
				else
					alert("����� �� ���� ���̵� �Դϴ�.");
				}
			})
		}
		function passwordCheckFunction(){
			var user_pw = $('#user_pw').val();
			var check_passwd = $('#check_passwd').val();
			if(user_pw != check_passwd){
				$('#passwordCheckMessage').html('��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�.');
			}else{
				$('#passwordCheckMessage').html('');
			}
		}
</script>
</head>
<body>
	<div id="regForm" class="box">
   <ul>
   	  <li><h3 style="text-align: center;">ȸ������</h3>
   	  <li><label for="user_name">�̸�</label>
				    <input type="text" id="user_name" name="user_name" placeholder="�̸�">
	  <li><label for="user_age">����</label>
					<select id="user_age" name="user_age">
					<option value="">���ɴ븦 �������ּ���.</option>
					<option value="10">10��</option>
					<option value="20">20��</option>
					<option value="30">30��</option>
					<option value="40">40��</option>
					<option value="50">50��</option>
					<option value="60">60�� �̻�</option>
					</select>
	  <li><label for="user_phone">�ڵ��� ��ȣ</label>
					<input type="text" id="user_phone" placeholder="�ڵ��� ��ȣ�� �Է��� �ּ���." name="user_phone" maxlength="20">
	  <li><label for="user_id">���̵�</label>
					<input type="text" id="user_id" placeholder="���̵�" name="user_id" maxlength="10" autofocus>
					<button onclik="registerCheckFunction();" type="button">�ߺ�üũ</button>
	  <li><label for="user_pw">��й�ȣ</label>
					<input type="password" id="user_pw" onkeyup="passwordCheckFunction();" placeholder="��й�ȣ" name="user_pw" maxlength="20">
	  <li><label for="repass">��й�ȣ Ȯ��</label>
					<input type="password" id="check_passwd" onkeyup="passwordCheckFunction();" placeholder="��й�ȣ Ȯ��" name="check_passwd" maxlength="20">
	  <li><label for="user_hope">���ɻ�ǰ</label>
					<input type="radio" name="user_hope" autocomplete="off" value="�Ƿ�" selected>�Ƿ�
					<input type="radio" name="user_hope" autocomplete="off" value="����">����
					<input type="radio" name="user_hope" autocomplete="off" value="����">����
	  <li><h5 style="color: red;" id="passwordCheckMessage"></h5>
				<li class="label2"><button id="process">����</button>
					<button id="cancle">���</button>											
   </ul>
</div>
<%
		String messageContent = null;
		if(session.getAttribute("messageContent") !=null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") !=null) {
			messageType = (String) session.getAttribute("messageType");
		}

		if(messageContent != null){
	%>
	
	<% if(messageType.equals("���� �޽���"))%>
		<script>
			alert(<%= messageType %>+"��"+<%= messageContent %>);
		</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
</body>
</html>