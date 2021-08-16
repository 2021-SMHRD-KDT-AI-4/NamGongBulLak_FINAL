package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DanceBoardDAO;

@WebServlet("/LikeService")
public class LikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int article_seq = Integer.parseInt(request.getParameter("article_seq"));
		System.out.println(article_seq);

		DanceBoardDAO dao = new DanceBoardDAO();
		int cnt = dao.like_plus(article_seq);

		if (cnt > 0) {
			System.out.println("like update 성공");
			int like = dao.select_like(article_seq);

			PrintWriter out = response.getWriter();
			out.print(like);
		} else {
			System.out.println("like update 실패");
		}

	}

}
