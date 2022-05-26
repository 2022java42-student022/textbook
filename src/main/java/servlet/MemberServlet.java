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

			// 正しい登録情報
			if (action.equals("preRegister") && request.getParameter("name").equals("")
					|| action.equals("preRegister") && request.getParameter("email").equals("")
					|| action.equals("preRegister") && request.getParameter("pass").equals("")) {
				request.setAttribute("message", "未入力項目があります。");
				gotoPage(request, response, "/error.jsp");
			}
			// メールアドレスが重複しないようにするやつ
			else if (action.equals("preRegister")) {
				String email = request.getParameter("email");
				if (dao.lockEmail(email)) {
					request.setAttribute("message", "すでに登録されているメールアドレスを使用しています。");
					gotoPage(request, response, "/error.jsp");
				} else {
					// 三戸部 会員登録
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
				// データーベースに入るよ
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
				bean2.setName(name);
				bean2.setEmail(email);
				bean2.setPass(pass);
				HttpSession session = request.getSession(true);
				session.setAttribute("member2", bean2);
				gotoPage(request, response, "/Member/memChangeConfirmation.jsp");
				return;

			}
			// 会員情報変更の情報取得 セッション
			if (action.equals("confirm")) {
				HttpSession session = request.getSession(false);
				// confirm は確認処理を行う
				MemberBean2 bean = new MemberBean2();
				bean.setName(request.getParameter("name"));
				bean.setEmail(request.getParameter("email"));
				bean.setPass(request.getParameter("pass"));

				session.setAttribute("member", bean);
				gotoPage(request, response, "/memChangeConfirmation.jsp");
			}
			if (action.equals("order")) {
				HttpSession session = request.getSession(false);
				MemberBean2 member = (MemberBean2) session.getAttribute("membar");
				if (member == null) {
					request.setAttribute("message", "正しく操作をしてください");
					gotoPage(request, response, "/error.jsp");
				}

			}

			// 会員情報変更確認→完了
			if (action.equals("change2")) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				System.out.println(name + email + pass);
				dao.changeByPrimaryuser(name, email, pass, user_id);
				System.out.println("伊賀越え");
				gotoPage(request, response, "/complete.jsp");
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
