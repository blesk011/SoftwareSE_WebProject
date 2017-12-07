package wedeal.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wedeal.bean.BoardDBBean;
import wedeal.bean.LikeDBBean;
import wedeal.bean.LikeDataBean;

/**
 * Servlet implementation class UserLikeListAction
 */
@WebServlet(value = "/UserLikeListAction", name = "UserLikeListAction")
public class UserLikeListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String session_id = null;
		ArrayList<LikeDataBean> likelist = null;
		BoardDBBean board = BoardDBBean.getinstance();
		ArrayList<String> board_name = new ArrayList<String>();
		
		if(request.getSession().getAttribute("user_id")!=null)
			session_id = (String)request.getSession().getAttribute("user_id");
		
		LikeDBBean like = LikeDBBean.getinstance();
		likelist = like.getList(session_id);
		for(LikeDataBean l : likelist) {
			board_name.add(board.getBoard(l.getBoard_num()).getBoard_title());
		}
		request.setAttribute("userlikelist", likelist);
		request.setAttribute("boardtitlelist", board_name);
		request.getRequestDispatcher("user/myLike.jsp").forward(request, response);
	}

}
