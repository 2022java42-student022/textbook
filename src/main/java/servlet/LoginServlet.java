package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AppCartBean;
import bean.CartBean;
import bean.MemberBean2;
import bean.TextBean;
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
		} else if (action.equals("login") && login.equals("member")) {
			String email = request.getParameter("user_id");
			String pass = request.getParameter("pass");
			try {
				LoginDAO dao = new LoginDAO();
				MemberDAO memberdao = new MemberDAO();
				if (dao.findMemAccount(email, pass)) {
					HttpSession session = request.getSession();
					session.setAttribute("login", "member");
					MemberBean2 bean = memberdao.SearchMember2(email);
					session.setAttribute("user_id", bean.getUser_id());
					session.setAttribute("memberchange", bean);
					gotoPage(request, response, "Login/memHome.jsp");
				} else {
					request.setAttribute("message", "メールアドレスまたはパスワードが違います。");
					gotoPage(request, response, "error.jsp");
				}

			} catch (DAOException e) {
				e.printStackTrace();
				request.setAttribute("message", "内部エラーが発生しました。");
				gotoPage(request, response, "error.jsp");
			}
		}

		if (action.equals("logout")) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				CartBean cart = (CartBean) session.getAttribute("cart");
				if (cart == null) {
					session.invalidate();
					request.setAttribute("message", "ログアウトが完了しました。");
					gotoPage(request, response, "complete.jsp");
					return;
				}
				AppCartBean app_cart = (AppCartBean) getServletContext().getAttribute("app_cart");
				for (TextBean text : cart.getTexts()) {
					app_cart.removeApp_cart(Integer.valueOf(text.getText_id()));
					break;
				}
				session.invalidate();
				request.setAttribute("message", "ログアウトが完了しました。");
				gotoPage(request, response, "complete.jsp");
			} else {
				request.setAttribute("message", "セッションがありません、ログインし直してください。");
				gotoPage(request, response, "error.jsp");
			}
		}

		if (action.equals("register")) {
			HttpSession session = request.getSession();
			session.setAttribute("login", "register");
			gotoPage(request, response, "Member/memRegister.jsp");

		}
		if (action.equals("registered")) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
				gotoPage(request, response, "/Login/top.jsp");
			} else {
				request.setAttribute("message", "セッションがありません、ログインし直してください。");
				gotoPage(request, response, "error.jsp");
			}
		}
		if (action.equals("noregister")) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
				gotoPage(request, response, "Login/top.jsp");
			} else {
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
