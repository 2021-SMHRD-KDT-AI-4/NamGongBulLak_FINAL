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

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String country = request.getParameter("country");
		String share_agree = request.getParameter("share_agree");
		String profile_image = request.getParameter("profile_image");

	    MemberDTO dto = new MemberDTO(id, pw, nickname, country, share_agree, profile_image);
	    MemberDAO dao = new MemberDAO();
	    
	    int cnt = dao.update(dto);

	    if (cnt > 0) {
	        System.out.println("정보수정 완료");
	        session.setAttribute("info", dto);
	        response.sendRedirect("mainKR.jsp");
	    }else {
	        System.out.println("정보수정 실패");
	        //response.sendRedirect("update.jsp");
	    }
		
	}

}

