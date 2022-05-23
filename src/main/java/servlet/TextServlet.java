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
import dao.TextDAO;

@WebServlet("/TextServlet")
public class TextServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String sort_id = request.getParameter("sort_id");
		String dep_name = null;
		String ISBN = request.getParameter("ISBN");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String use = request.getParameter("use");
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			request.setAttribute("message", "セッションが切れています。もう一度トップページより操作してください。");
			gotoPage(request,response,"/error.jsp");
			return;
		}
		

		//エラー処理の記述・数字を数値に変換
		try {
			TextDAO dao = new TextDAO();
			if (action == null || action.length() == 0) {
				gotoPage(request, response, "/error.jsp");
			} else if (action.equals("preRegister")) {
				try {
				int text_price = Integer.parseInt(price);
				int text_sort_id = Integer.parseInt(sort_id);
				
				TextBean bean = new TextBean();
				bean.setPrice(text_price);
				bean.setSort_id(text_sort_id);
				bean.setISBN(ISBN);
				bean.setTitle(title);
				bean.setAuthor(author);
				bean.setUse(use);
				dao.RegisterAllCategory(bean);
				session.setAttribute("text", bean);
				gotoPage(request, response, "/textRegisterConfirmation.jsp");
				} catch (NumberFormatException e) {
					e.printStackTrace();
					request.setAttribute("message","値段に数値を入力してください");
					gotoPage(request, response, "/error.jsp");
				}
		
				
			//分類IDで検索	
			} else if (action.equals("search")) {
					int text_sort_id = Integer.parseInt(request.getParameter(sort_id));
					
				    List<TextBean>list = dao.findBySort_id(text_sort_id);
					request.setAttribute("text", list);
					gotoPage(request, response, "/textSerchResultMember.jsp");
					
					
			//タイトルで検索		
			} else if (action.equals("search")) {
				int text_sort_id = Integer.parseInt(request.getParameter(sort_id));
				
			    List<TextBean>list = dao.findByTitle(title);
				request.setAttribute("text", list);
				gotoPage(request, response, "/textSerchResultMember.jsp");
		} 
			
		} catch (DAOException e) {
			request.setAttribute("message","内部エラーが発生しました。");
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
