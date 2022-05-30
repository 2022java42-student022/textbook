package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.TextBean;
import dao.DAOException;
import dao.SortDAO;
import dao.TextDAO;

@WebServlet("/TextServlet")
public class TextServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		String sort_id = request.getParameter("sort_id");
		String ISBN = request.getParameter("ISBN");

		// ISBNを13桁に指定
		// 桁数が未満の数値は0を自動的に追加
		if (request.getParameter("ISBN") == null) {
			ISBN = "";
		} else if (request.getParameter("ISBN").length() != 0) {
			try {
				ISBN = String.format("%013d", Long.parseLong(request.getParameter("ISBN")));
			} catch (NumberFormatException e) {
				e.printStackTrace();
				request.setAttribute("message", "ISBNに13桁の数値を入力してください");
				gotoPage(request, response, "/error.jsp");
			}
		}

		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String use = request.getParameter("use");

		HttpSession session = request.getSession(false);
		if (session == null) {
			request.setAttribute("message", "セッションが切れています。もう一度トップページより操作してください。");
			gotoPage(request, response, "/error.jsp");
			return;
		}

		// 教科書の登録
		try {
			TextDAO dao = new TextDAO();
			if (action == null || action.length() == 0) {
				gotoPage(request, response, "/error.jsp");

			} else if (action.equals("preRegister")) {
				if (title.length() == 0 || author.length() == 0 || use.length() == 0) {
					request.setAttribute("message", "値を入力してください");
					gotoPage(request, response, "/error.jsp");
				} else {
					try {
						int text_price = Integer.parseInt(price);
						int text_sort_id = Integer.parseInt(sort_id);
						long text_ISBN = Long.parseLong(ISBN);

						TextBean bean = new TextBean();
						bean.setPrice(text_price);
						bean.setSort_id(text_sort_id);
						bean.setISBN(text_ISBN);
						bean.setTitle(title);
						bean.setAuthor(author);
						bean.setUse(use);
						SortDAO sortDAO = new SortDAO();
						bean.setDep_name(sortDAO.findDep_name(text_sort_id));
						bean.setUser_id((int) session.getAttribute("user_id"));
						session.setAttribute("text", bean);
						gotoPage(request, response, "/Text/textRegisterConfirmation.jsp");
					} catch (NumberFormatException e) {
						e.printStackTrace();
						request.setAttribute("message", "正しい数値を入力してください");
						gotoPage(request, response, "/error.jsp");
					}
				}

				// 教科書登録
			} else if (action.equals("register")) {
				TextBean bean = (TextBean) session.getAttribute("text");
				dao.RegisterAllCategory(bean);
				request.setAttribute("message", "教科書の登録が完了しました！");
				gotoPage(request, response, "/complete.jsp");

				// ----------------------------------------ここから各項目別での検索(会員と管理人別)----------------------------------------

				// 全ての教科書表示(会員)
			} else if (action.equals("searchAll_member")) {
				List<TextBean> list = dao.findAllMember();
				if (list.size() != 0) {
					request.setAttribute("texts", list);
					gotoPage(request, response, "/Text/textSearchResultMember.jsp");
				} else {
					request.setAttribute("message", "検索結果がありません");
					gotoPage(request, response, "/error.jsp");
				}

				// 全ての教科書表示(管理者)
			} else if (action.equals("searchAll_mg")) {
				List<TextBean> list = dao.findAllMg();
				if (list.size() != 0) {
					request.setAttribute("texts", list);
					gotoPage(request, response, "/Text/textSearchResultMg.jsp");
				} else {
					request.setAttribute("message", "検索結果がありません");
					gotoPage(request, response, "/error.jsp");
				}

				// 分類名で検索(会員)
			} else if (action.equals("search_sort_id_member")) {
				int text_sort_id = Integer.parseInt(request.getParameter("sort_id"));
				List<TextBean> list = dao.findBySort_idMember(text_sort_id);
				if (list.size() != 0) {
					request.setAttribute("texts", list);
					gotoPage(request, response, "/Text/textSearchResultMember.jsp");
				} else {
					request.setAttribute("message", "検索結果がありません");
					gotoPage(request, response, "/error.jsp");
				}

				// 分類名で検索(管理者)
			} else if (action.equals("search_sort_id_mg")) {
				int text_sort_id = Integer.parseInt(request.getParameter("sort_id"));
				List<TextBean> list = dao.findBySort_idMg(text_sort_id);
				if (list.size() != 0) {
					request.setAttribute("texts", list);
					gotoPage(request, response, "/Text/textSearchResultMg.jsp");
				} else {
					request.setAttribute("message", "検索結果がありません");
					gotoPage(request, response, "/error.jsp");
				}

				// タイトルで検索(会員)
			} else if (action.equals("search_title_member")) {
				if (title.length() == 0) {
					request.setAttribute("message", "値を入力してください");
					gotoPage(request, response, "/error.jsp");
				} else {
					List<TextBean> list = dao.findByTitleMember(title);
					if (list.size() != 0) {
						request.setAttribute("texts", list);
						gotoPage(request, response, "/Text/textSearchResultMember.jsp");
					} else {
						request.setAttribute("message", "検索結果がありません");
						gotoPage(request, response, "/error.jsp");
					}
				}
				// タイトルで検索(管理者)
			} else if (action.equals("search_title_mg")) {
				if (title.length() == 0) {
					request.setAttribute("message", "値を入力してください");
					gotoPage(request, response, "/error.jsp");
				} else {
					List<TextBean> list = dao.findByTitleMg(title);
					if (list.size() != 0) {
						request.setAttribute("texts", list);
						gotoPage(request, response, "/Text/textSearchResultMg.jsp");
					} else {
						request.setAttribute("message", "検索結果がありません");
						gotoPage(request, response, "/error.jsp");
					}
				}

				// ----------------------------------------ここまで各項目別での検索(会員と管理人別)----------------------------------------

				// 登録している教科書を参照
			} else if (action.equals("reference")) {
				int user_id = (int) session.getAttribute("user_id");
				List<TextBean> list = dao.findByUser_id(user_id);
				session.setAttribute("textbooks", list);
				gotoPage(request, response, "Text/showMyText.jsp");

				// 登録している教科書を選択して変更画面に移動
			} else if (action.equals("inputChange")) {
				int text_id = Integer.parseInt(request.getParameter("text_id"));
				TextBean bean = new TextBean();
				bean = dao.preChange(bean, text_id);
				session.setAttribute("change_text_id", text_id);
				session.setAttribute("text_prechange", bean);
				gotoPage(request, response, "Text/textChange.jsp");

				// 選択した教科書の内容変更
			} else if (action.equals("preChange")) {
				if (title.length() == 0 || author.length() == 0 || use.length() == 0) {
					request.setAttribute("message", "値を入力してください");
					gotoPage(request, response, "/error.jsp");
				} else {
					try {
						int text_price = Integer.parseInt(price);
						int text_sort_id = Integer.parseInt(sort_id);
						long text_ISBN = Long.parseLong(ISBN);

						TextBean bean = new TextBean();
						bean.setPrice(text_price);
						bean.setSort_id(text_sort_id);
						bean.setISBN(text_ISBN);
						bean.setTitle(title);
						bean.setAuthor(author);
						bean.setUse(use);
						SortDAO sortDAO = new SortDAO();
						bean.setDep_name(sortDAO.findDep_name(text_sort_id));
						bean.setText_id((int) session.getAttribute("change_text_id"));
						session.setAttribute("changetext", bean);
						gotoPage(request, response, "/Text/textChangeConfirmation.jsp");
					} catch (NumberFormatException e) {
						e.printStackTrace();
						request.setAttribute("message", "正しい操作を行って下さい。");
						gotoPage(request, response, "/error.jsp");
					}
				}

				// 教科書の内容変更完了画面へ
			} else if (action.equals("change")) {
				TextBean bean = (TextBean) session.getAttribute("changetext");
				dao.changeText(bean);
				request.setAttribute("message", "変更が完了しました。");
				gotoPage(request, response, "/complete.jsp");

				// 教科書の削除確認画面へ
			} else if (action.equals("predelete")) {
				int text_id = Integer.parseInt(request.getParameter("text_id"));
				TextBean bean = dao.preDeleteByText_id(text_id);
				session.setAttribute("delete_textbooks", bean);
				gotoPage(request, response, "Text/textDeleteConfirmation.jsp");

				// 選択している教科書を削除
			} else if (action.equals("delete")) {
				TextBean bean = (TextBean) session.getAttribute("delete_textbooks");
				dao.deleteByText_id(bean.getText_id());
				session.setAttribute("message", "削除が完了しました。");
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

		doGet(request, response);
	}

}
