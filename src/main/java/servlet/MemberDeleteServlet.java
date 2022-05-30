package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberBean2;
import dao.DAOException;
import dao.MemberDAO;

@WebServlet("/MemberDeleteServlet")
public class MemberDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			MemberDAO dao = new MemberDAO();
			MemberBean2 bean = new MemberBean2();
			String pass = request.getParameter("pass");
			HttpSession session = request.getSession(false);
			bean = (MemberBean2) session.getAttribute("memberchange");
			if (pass.equals(dao.searchByUser_id(bean.getUser_id()))) {
				dao.deleteByPrimaryuser(bean.getUser_id());
				session.invalidate();
				request.setAttribute("message", "削除されました。");

				gotoPage(request, response, "/complete.jsp");
				return;
			} else {
				request.setAttribute("message", "パスワードが違います。");
				gotoPage(request, response, "/error.jsp");
				return;
			}
		} catch (DAOException e) {
			request.setAttribute("message", "内部エラーが発生しました。");
			gotoPage(request, response, "/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void gotoPage(HttpServletRequest request, HttpServletResponse response, String page)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
