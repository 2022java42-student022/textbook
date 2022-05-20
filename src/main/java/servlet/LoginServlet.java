package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOException;
import dao.LoginDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String login = request.getParameter("login");
		if (action.equals("login") && login.equals("manager")) {
			String email = request.getParameter("user_id");
			String pass = request.getParameter("pass");
			try {
				LoginDAO dao = new LoginDAO();
				if (dao.findAccount(email, pass)) {
					gotoPage(request, response, "Login/mgHome.jsp");
				}

			} catch (DAOException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void gotoPage(HttpServletRequest request,
			HttpServletResponse response, String page) throws ServletException,
	        IOException{
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
