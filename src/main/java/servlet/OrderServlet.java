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
import bean.MemberBean;
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
		//CartBeanはあとでかきます
		
		try {
			String action = request.getParameter("action");
			if (action == null || action.length() == 0 || action.equals("inputMember")) {
			gotoPage(request, response, "/memberInfo.jsp");
			} else if (action.equals("confirm")) {
				MemberBean bean = new MemberBean();
				bean.setName(request.getParameter("name"));
				bean.setEmail(request.getParameter("email"));
				bean.setPass(request.getParameter("pass"));
				bean.setAddress(request.getParameter("address"));
				bean.setTel(request.getParameter("tel"));
				bean.setPay(request.getParameter("pay")); //まとめて記載可能
				session.setAttribute("customer", bean);
				gotoPage(request,response,"/confirm.jsp");
			} else if (action.equals("order")) {
				MemberBean member = (MemberBean)session.getAttribute("customer");
				if (member == null) {
					request.setAttribute("message", "正しく操作してください。");
					gotoPage(request, response, "/error.jsp");
					return;
				}
				
				
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
		doGet(request, response);
	}

}
