package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logoutservice")
public class Logoutservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("info");
		
		String req = request.getParameter("a");
		if(req.equals("EN")) {
			response.sendRedirect("mainEN.jsp");
		} else {
			response.sendRedirect("mainKR.jsp");
		}

		
	}
}
