package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOException;
import dao.LoginDAO;
import dao.MemberDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String login = request.getParameter("login");
		if (action.equals("login") && login.equals("manager")) {
			String email = request.getParameter("user_id");
			String pass = request.getParameter("pass");
			try {
				LoginDAO dao = new LoginDAO();
				if (dao.findMgAccount(email, pass)) {
					HttpSession session = request.getSession();
					session.setAttribute("login", "manager");
					gotoPage(request, response, "Login/mgHome.jsp");
				} else {
					request.setAttribute("message", "メールアドレスまたはパスワードが違います。");
					gotoPage(request, response, "error.jsp");
				}

			} catch (DAOException e) {
				e.printStackTrace();
			}
		} 
		else if (action.equals("login") && login.equals("member")) {
			String email = request.getParameter("user_id");
			String pass = request.getParameter("pass");
			try {
				LoginDAO dao = new LoginDAO();
				if (dao.findMemAccount(email, pass)) {
					HttpSession session = request.getSession();
					session.setAttribute("login", "member");
					MemberDAO memDao = new MemberDAO();
					session.setAttribute("user_id", memDao.searchByEmail(email));
					gotoPage(request, response, "Login/memHome.jsp");
				} else {
					request.setAttribute("message", "メールアドレスまたはパスワードが違います。");
					gotoPage(request, response, "error.jsp");
				}

			} catch (DAOException e) {
				e.printStackTrace();
			}
		}
		
		if (action.equals("logout")) {
			HttpSession session = request.getSession();
			if(session != null) {
			session.invalidate();
			}else {
				request.setAttribute("message", "セッションがありません、ログインし直してください。");
				gotoPage(request, response, "error.jsp");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void gotoPage(HttpServletRequest request, HttpServletResponse response, String page)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
