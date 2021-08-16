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
		request.setCharacterEncoding("EUC-KR"); // post��� ���ڵ�
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int play_seq = Integer.parseInt(request.getParameter("play_seq"));
		String upload_filename = request.getParameter("upload_filename");
		
		System.out.println("���� : " + subject);
		System.out.println("�ۼ��� : " + id);
		System.out.println("���� : " + content);
		System.out.println("�÷��̰�����ȣ : " + play_seq);
		System.out.println("���� �̸� : " + upload_filename);
		
		//BoardWriteDTO dto = new BoardWriteDTO(user_filename, subject, content);
		DanceBoardDTO dto = new DanceBoardDTO(subject, content, id, play_seq,upload_filename);
		DanceBoardDAO dao = new DanceBoardDAO();
		
		int cnt = dao.upload(dto);
		
		if(cnt > 0) {
			System.out.println("���ε� ����");
		} else {
			System.out.println("���ε� ����");
		}
		
		response.sendRedirect("boardKR.jsp");
		
	}

}
