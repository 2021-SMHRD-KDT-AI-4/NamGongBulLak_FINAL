package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DanceBoardDAO;
import model.DanceBoardDTO;

@WebServlet("/WriteBoardService")  //WriteBoard_test
public class WriteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR"); // post방식 인코딩
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int play_seq = Integer.parseInt(request.getParameter("play_seq"));
		String upload_filename = request.getParameter("upload_filename");
		
		System.out.println("제목 : " + subject);
		System.out.println("작성자 : " + id);
		System.out.println("내용 : " + content);
		System.out.println("플레이고유번호 : " + play_seq);
		System.out.println("파일 이름 : " + upload_filename);
		
		//BoardWriteDTO dto = new BoardWriteDTO(user_filename, subject, content);
		DanceBoardDTO dto = new DanceBoardDTO(subject, content, id, play_seq,upload_filename);
		DanceBoardDAO dao = new DanceBoardDAO();
		
		int cnt = dao.upload(dto);
		
		if(cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}
		
		response.sendRedirect("boardKR.jsp");
		
	}

}
