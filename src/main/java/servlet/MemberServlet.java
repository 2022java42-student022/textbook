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
		request.setCharacterEncoding("UTF-8");

		// パラメータの解析
		String action = request.getParameter("action");

		try {
			MemberDAO dao = new MemberDAO();
			if (action == null || action.length() == 0 || action.equals("search")) {
				try {

					String email = request.getParameter("email");

					MemberBean2 bean = dao.SearchMember2(email);
					if (bean == null) {
						request.setAttribute("message", "正しいメールアドレスを入力してください。");
						gotoPage(request, response, "/error.jsp");
					}
					// リクエストスコープに入れてJSPへフォーワードする
					HttpSession session = request.getSession();
					session.setAttribute("member_search", bean);
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
			}
			// 会員情報削除
			if (action.equals("decision")) {
				HttpSession session = request.getSession(false);
				MemberBean2 bean = (MemberBean2) session.getAttribute("member_search");
				int user_id = bean.getUser_id();
				// Integer.parseInt(request.getParameter("user_id"));
				dao.deleteByPrimaryuser(user_id);

				request.setAttribute("message", "削除されました。");

				gotoPage(request, response, "/complete.jsp");
				return;

			}

			// 正しい登録情報
			if (action.equals("preRegister") && request.getParameter("name").equals("")
					|| action.equals("preRegister") && request.getParameter("email").equals("")
					|| action.equals("preRegister") && request.getParameter("pass").equals("")) {
				request.setAttribute("message", "未入力項目があります。");
				gotoPage(request, response, "/error.jsp");

			}
			// 三戸部 会員登録
			else if (action.equals("preRegister")) {
                String email = request.getParameter("email");
				if (dao.lockEmail(email)) {
					request.setAttribute("message", "すでに登録されているメールアドレスを使用しています。");
					gotoPage(request, response, "/error.jsp");
				} else {
					String name = request.getParameter("name");
					String email2 = request.getParameter("email");
					String pass = request.getParameter("pass");
					MemberBean2 bean2 = new MemberBean2();
					bean2.setName(name);
					bean2.setEmail(email2);
					bean2.setPass(pass);
					HttpSession session = request.getSession(true);
					session.setAttribute("member", bean2);
					gotoPage(request, response, "/Member/memRegisterConfirmation.jsp");
				}
			}
			// 会員登録完了
			if (action.equals("register")) {
				HttpSession session = request.getSession(false);
				MemberBean2 bean2 = (MemberBean2) session.getAttribute("member");

				dao.addMember(bean2);
				request.setAttribute("message", "会員登録が完了しました。");
				gotoPage(request, response, "/complete.jsp");
			}
			// 会員情報変更→会員情報変更確認
			if (action.equals("preChange")) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				MemberBean2 bean2 = new MemberBean2();
				HttpSession session = request.getSession(false);
				MemberBean2 bean = (MemberBean2) session.getAttribute("member_search");
				bean2.setName(name);
				bean2.setEmail(email);
				bean2.setPass(pass);
				bean2.setUser_id(bean.getUser_id());
				session.setAttribute("member2", bean2);
				gotoPage(request, response, "/Member/memChangeConfirmation.jsp");
				return;

			}

			// 会員情報変更の情報取得 セッション
			if (action.equals("comfirm")) {
				HttpSession session = request.getSession(false);
				if (session == null) { // セッションオブジェクトをなし
					request.setAttribute("message", "セッションが切れています。もう一度トップページより操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;
				}
				MemberBean2 member2 = (MemberBean2) session.getAttribute("member2");
				if (member2 == null) {
					request.setAttribute("message", "操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;
				}

				// 変更確認画面→完了画面
				if (member2 != null) {
					dao.changeByPrimaryuser(member2);
					request.setAttribute("message", "変更が完了しました。");
					gotoPage(request, response, "/complete.jsp");
				}
				 // 会員側  topから変更画面移動
				if (action.equals("inputChange")) {
					gotoPage(request, response, "/Member/memChange.jsp");
				}
			}	

		} catch (DAOException e) {
			request.setAttribute("message", "内部エラーが発生しました。");
			gotoPage(request, response, "/error.jsp");
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
