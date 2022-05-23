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

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// パラメータの解析
		String action = request.getParameter("action");
		if (action.equals("search")) {
			gotoPage(request, response, "/Member/memSearchResult.jsp");

		}

		// パラメータの解析
		else if (action.equals("change")) {
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

		if (action.equals("preRegister")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			MemberBean2 bean2 = new MemberBean2();
			bean2.setName(name);
			bean2.setEmail(email);
			bean2.setPass(pass);
			
			HttpSession session = request.getSession();
			session.setAttribute("member", bean2);
			gotoPage(request, response, "/Member/memRegisterConfirmation.jsp");
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
