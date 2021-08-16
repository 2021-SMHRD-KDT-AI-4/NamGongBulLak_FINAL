package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/JoinService")
public class Joinservice extends HttpServlet {
	private static final long serialVersionUID = 1L;


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			request.setCharacterEncoding("EUC-KR");

			// ������ ����� ��� 								   ������θ� ������(�����ų ���)
			String savePath = request.getServletContext().getRealPath("profile_img");
			
			System.out.println(savePath);
			
			// �̹��� ũ�� ����
			int maxSize = 50*1024*1024; // 5mb
			
			// ���� �̸� ���ڵ� ���
			String encoding = "EUC-KR";
			
			//request, ����������, ������, ���ڵ� ���, �ߺ����ſ��� 
			// DefaultFileRenamePolicy : ���ϸ� �ڿ� ���ڸ� �ٿ��� �̸� �ߺ��� �������ִ� Ŭ����(���� �̸��� �� �ڿ� 1,2... �̷�������)
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickname = request.getParameter("nickname"); 
			String country = request.getParameter("country");
			String share_agree = request.getParameter("share_agree");
			String profile_image = URLEncoder.encode(multi.getFilesystemName("profile_image"), "EUC-KR");
			
			System.out.println("id : " + id + " / pw : " + pw + " / nickname : " + nickname + " / country : " +country + " / share_agree : " +share_agree + " / profile_image : "  +profile_image);
			System.out.println("??????????");

			System.out.println("filename : " + profile_image);

			
			MemberDTO dto = new MemberDTO(id, pw, nickname, country, share_agree, profile_image);
			MemberDAO dao = new MemberDAO();
			
			int cnt = dao.join(dto);
			
			if(cnt > 0) {
				System.out.println("ȸ������ �Ϸ�");
				System.out.println("??????????");
				response.sendRedirect("loginKR.jsp");
			}else {
				System.out.println("���� ����");
				System.out.println("??????????");
				response.sendRedirect("joinKR.jsp");
			}
		
		}
	}
