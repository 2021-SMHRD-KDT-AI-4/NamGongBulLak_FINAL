package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.RankingCountryDAO;
import model.RankingCountryDTO;

@WebServlet("/RankCountryService")
public class RankCountryService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String country = request.getParameter("country");
		System.out.println(country);
		RankingCountryDTO dto = new RankingCountryDTO(country);
		RankingCountryDAO dao = new RankingCountryDAO();
		
		ArrayList<RankingCountryDTO> cnt = dao.RankingCountry(country);
		
		if(cnt.size() > 0) {
			System.out.println("나라노래 리스트성공");
			ArrayList<RankingCountryDTO> RClist = dao.RankingCountry(country);
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String result = gson.toJson(RClist);
			out.println(result);
			
			
		}else {
			System.out.println("나라노래 리스트실패");
		}
	}

}
