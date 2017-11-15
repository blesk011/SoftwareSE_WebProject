package user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedeal.command.CommandAction;

public class UserTelModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		String user_phone = (String) request.getAttribute("user_phone");
		
		boolean result = new userDAO().modifyPhone(user_id, user_phone);
		
		if(result == true) {
			response.sendRedirect("user/userinfo.jsp");
			return null;
		}
		else if(result == false) {
			request.getSession().setAttribute("messageType", "�����޼���");
			request.getSession().setAttribute("messageContent", "�������� �����Դϴ�.");
			response.sendRedirect("user/userinfo.jsp");
			return null;
		}
		
		return null;
	}

}
