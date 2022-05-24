package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import bean.TextBean;
import dao.DAOException;
import dao.TextDAO;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.length() == 0 || action.equals("show")) {
				gotoPage(request, response, "/cart.jsp");
			} else if (action.equals("add")) {
				int text_id = Integer.parseInt(request.getParameter("text_id"));
				HttpSession session = request.getSession(true);
				CartBean cart = (CartBean) session.getAttribute("cart");
				if (cart == null) {
					cart = new CartBean();
					session.setAttribute("cart", cart);
				}
				TextDAO dao = new TextDAO();
				TextBean bean = dao.findByPrimaryKey(text_id);//text_idで教科書1冊を検索してレコードをTextBeanに入れる
				cart.addCart(bean);
				gotoPage(request, response, "/cart.jsp");
			} else if (action.equals("delete")) {
				HttpSession session = request.getSession(false);
				if (session == null) {
					request.setAttribute("message", "セッションが途切れています。もう一度ホームページより操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;
				}
				CartBean cart = (CartBean) session.getAttribute("cart");
				if (cart == null) {
					request.setAttribute("message", "正しく操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;
				}
				int text_id = Integer.parseInt(request.getParameter("text_id"));
				cart.deleteCart(text_id);
				gotoPage(request, response, "/cart.jsp");
			} else {
				request.setAttribute("message", "正しく操作してください。");
				gotoPage(request, response, "/error.jsp");
			}
		} catch (DAOException e) {
			e.printStackTrace();
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
