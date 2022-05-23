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

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// パラメータの解析
		String action = request.getParameter("action");

		try {
			if (action == null || action.length() == 0 || action.equals("search")) {

				int user_id = Integer.parseInt(request.getParameter("user_id"));
				MemberDAO dao = new MemberDAO();
				MemberBean2 bean = dao.SearchMember2(user_id);

				if (bean == null) {
					request.setAttribute("message", "正しい会員番号を入力してください。");
					gotoPage(request, response, "/error.jsp");
				}
				
				// リクエストスコープに入れてJSPへフォーワードする

				HttpSession session = request.getSession();

				session.setAttribute("member2", bean);
				gotoPage(request, response, "/Member/memSearchResult.jsp");
			}
		} catch (DAOException e) {
			e.printStackTrace();
			request.setAttribute("message", "内部エラーが発生しました。");
			gotoPage(request, response, "/error.jsp");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			request.setAttribute("message", "数字を入力してください。");
			gotoPage(request, response, "/error.jsp");
		}

		// パラメータの解析
		if (action.equals("change"))

		{
			{
				gotoPage(request, response, "/Member/memChange.jsp");
			}
		}
		// パラメータの解析
		else if (action.equals("delete")) {
			gotoPage(request, response, "/Member/memDeleteConfirmation.jsp");
		} else {

		}

		if (action.equals("decision")) {
			gotoPage(request, response, "/complete.jsp");
		}

		if (action.equals("change2")) {
			gotoPage(request, response, "/complete.jsp");
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
