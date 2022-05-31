package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import bean.OrderCheckBean;
import bean.TextBean;
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
		if (cart == null) {
			request.setAttribute("message", "正しく操作してください。");
			gotoPage(request, response, "/error.jsp");
			return;
		}

		try {
			String action = request.getParameter("action");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String pay = request.getParameter("pay");
			if (action == null || action.length() == 0 || action.equals("input_member")) {
				int user_id = (int) session.getAttribute("user_id");
				OrderDAO dao = new OrderDAO();
				request.setAttribute("mem_detail", dao.shearchByUser_id(user_id));
				gotoPage(request, response, "/order/memberInfo.jsp");
			}
			if (action.equals("confirm")) {
				if (name.length() == 0 || address.length() == 0 || tel.length() == 0 || email.length() == 0
						|| pay == null) {
					request.setAttribute("message", "項目を入力してください。");
					gotoPage(request, response, "/error.jsp");
				} else {
					OrderCheckBean bean = new OrderCheckBean();
					bean.setName(request.getParameter("name"));
					bean.setAddress(request.getParameter("address"));
					bean.setTel(request.getParameter("tel"));
					bean.setEmail(request.getParameter("email"));
					bean.setPay(request.getParameter("pay")); // まとめて記載可能
					session.setAttribute("check", bean);
					gotoPage(request, response, "/order/confirm.jsp");
				}
			}
			if (action.equals("order")) {
				OrderCheckBean check = (OrderCheckBean) session.getAttribute("check");
				if (check == null) {
					request.setAttribute("message", "正しく操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;

				}

				OrderDAO order = new OrderDAO();
				// 購入済みか否か判定する
				ArrayList<String> soldcheck = new ArrayList<String>();
				List<TextBean> texts = cart.getTexts();
				for (TextBean text : texts) {
					int soldout = order.checkSoldOut(text.getText_id());
					if (soldout == 1) {
						soldcheck.add(text.getTitle());
					}
				}
				if (soldcheck.size() >= 1) {
					String msg = String.join(",", soldcheck) + "は売り切れています。";
					request.setAttribute("message", msg);
					gotoPage(request, response, "/error.jsp");
					return;
				}

				int user_id = (int) session.getAttribute("user_id");
				int orderID = order.orderMem(check, cart, user_id);
				for (TextBean text : texts) {
					order.sendSoldOut(text.getText_id());
				}

				session.removeAttribute("cart");
				session.removeAttribute("check");
				request.setAttribute("orderID", Integer.valueOf(orderID));
				gotoPage(request, response, "/order/order.jsp");

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
