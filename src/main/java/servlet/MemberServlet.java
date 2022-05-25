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
import dao.LoginDAO;
import dao.MemberDAO;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// パラメータの解析
		String action = request.getParameter("action");

		try {
			MemberDAO dao = new MemberDAO();
			if (action == null || action.length() == 0 || action.equals("search")) {
				try {
					int user_id = Integer.parseInt(request.getParameter("user_id"));

					MemberBean2 bean = dao.SearchMember2(user_id);
					if (bean == null) {
						request.setAttribute("message", "正しい会員番号を入力してください。");
						gotoPage(request, response, "/error.jsp");
					}
					// リクエストスコープに入れてJSPへフォーワードする
					HttpSession session = request.getSession();
					session.setAttribute("member2", bean);
					gotoPage(request, response, "/Member/memSearchResult.jsp");
				} catch (NumberFormatException e) {
					e.printStackTrace();
					request.setAttribute("message", "数字を入力してください。");
					gotoPage(request, response, "/error.jsp");
				}
			}
			// パラメータの解析
			if (action.equals("change")) {
				gotoPage(request, response, "/Member/memChange.jsp");
				// パラメータの解析
			} else if (action.equals("delete")) {
				gotoPage(request, response, "/Member/memDeleteConfirmation.jsp");
			} else {

			}
			// 会員情報削除
			if (action.equals("decision")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				dao.deleteByPrimaryuser(user_id);

				HttpSession session = request.getSession(false);
				session.setAttribute("member2", null);
				gotoPage(request, response, "/complete.jsp");
				return;

			}
			if (action.equals("change2")) {
				gotoPage(request, response, "/complete.jsp");
			}

			if (action.equals("preRegister")) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				MemberBean2 bean2 = new MemberBean2();
				bean2.setName(name);
				bean2.setEmail(email);
				bean2.setPass(pass);
				HttpSession session = request.getSession(true);
				session.setAttribute("login", "");
				session.setAttribute("member", bean2);
				gotoPage(request, response, "/Member/memRegisterConfirmation.jsp");
			}
			if (action.equals("register")) {
				HttpSession session = request.getSession(false);
				MemberBean2 bean2 = (MemberBean2) session.getAttribute("member");

				dao.addMember(bean2);
				request.setAttribute("message", "会員登録が完了しました。");
				gotoPage(request, response, "/complete.jsp");
			}

		} catch (DAOException e) {
			request.setAttribute("message", "内部エラーが発生しました。");
			gotoPage(request, response, "/error.jsp");
		}
		
		
		if (action.equals("preRegister") && regis.equals("member")) {
			String email = request.getParameter("user_id");
			try {
				LoginDAO dao = new LoginDAO();
				if (dao.Account(email)) {
					HttpSession session = request.getSession();
					session.setAttribute("login", "member");
					MemberDAO memDao = new MemberDAO();
					int user_id = memDao.searchByEmail(email);
					session.setAttribute("user_id", user_id);
					gotoPage(request, response, "Login/memHome.jsp");
				}

			} catch (DAOException e) {
				e.printStackTrace();
				request.setAttribute("message", "内部エラーが発生しました。");
				gotoPage(request, response, "error.jsp");
			}
		}

	}

	private void gotoPage(HttpServletRequest request, HttpServletResponse response, String page)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
