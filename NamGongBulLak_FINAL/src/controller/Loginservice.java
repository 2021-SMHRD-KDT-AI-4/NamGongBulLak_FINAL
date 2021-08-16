package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/Loginservice")
public class Loginservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDTO dto = new MemberDTO(id, pw);
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(dto);
		System.out.println(info);
		if (info != null) {
			//
			HttpSession session = request.getSession();
			//
			session.setMaxInactiveInterval(500);
			session.setAttribute("info", info);
			System.out.println("로그인 완료");
			
			String req = request.getParameter("a");
			if(req.equals("EN")) {
				response.sendRedirect("mainEN.jsp");
			} else {
				response.sendRedirect("mainKR.jsp");
			}
			
			// response.sendRedirect("loginsuccess.jsp");
		} else {
			System.out.println("로그인 실패");
			
			String req = request.getParameter("a");
			if(req.equals("EN")) {
				response.sendRedirect("loginEN.jsp");
			} else {
				response.sendRedirect("loginKR.jsp");
			}

		}
	}

}
