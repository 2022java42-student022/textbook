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
import bean.MemberBean2;
import bean.OrderCheckBean;
import dao.DAOException;
import dao.OrderDAO;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			request.setAttribute("message", "時間切れです、再度ログインしてください。");
			gotoPage(request, response, "/error.jsp");
			return;
		}

		CartBean cart = (CartBean) session.getAttribute("cart");
//		if(cart == null) {   //カートに情報が入ってないので現在コメントアウト中
//			request.setAttribute("message", "正しく操作してください。");
//			gotoPage(request, response, "/error.jsp");
//			return;
//		}

		try {
			String action = request.getParameter("action");
//			String name = request.getParameter("name");
//			String address = request.getParameter("address");
//			String tel = request.getParameter("tel");
//			String mail = request.getParameter("mail");
//			String pay = request.getParameter("pay");
			if (action == null || action.length() == 0 || action.equals("input_member")) {
				gotoPage(request, response, "/order/memberInfo.jsp");
			}
			if (action.equals("confirm")) {
				OrderCheckBean bean = new OrderCheckBean();
				bean.setName(request.getParameter("name"));
				bean.setAddress(request.getParameter("address"));
				bean.setTel(request.getParameter("tel"));
				bean.setMail(request.getParameter("mail"));
				bean.setPay(request.getParameter("pay")); // まとめて記載可能
				session.setAttribute("check", bean);
				gotoPage(request, response, "/order/confirm.jsp");
			}
//			if (action.equals("confirm") || name.length() == 0 || address.length() == 0 || tel.length() == 0
//					|| mail.length() == 0 || pay.length() == 0) {
//				request.setAttribute("message", "入力してください。");
//				gotoPage(request, response, "/error.jsp");
//			}
			if (action.equals("order")) {
				OrderCheckBean check = (OrderCheckBean) session.getAttribute("check");
				if (check == null) {
					request.setAttribute("message", "正しく操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;

				}

				OrderDAO order = new OrderDAO();
				MemberBean2 member2 = (MemberBean2) session.getAttribute("member2"); // sessionの中にあるものから型名と属性名を指定して探して取得
				int user_id = member2.getUser_id();
				int orderID = order.orderMem(check, cart, user_id);
				session.removeAttribute("cart");
				session.removeAttribute("check");
				request.setAttribute("orderID", Integer.valueOf(orderID));
				gotoPage(request, response, "/order.jsp");
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
		doGet(request, response);
	}

}
