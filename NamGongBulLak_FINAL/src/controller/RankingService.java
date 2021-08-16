package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RankingService")
public class RankingService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		float score1 = Float.parseFloat(request.getParameter("score"));
		String[] mgdgrper = request.getParameter("mgdgrper").split("/");
		
		float miss = Float.parseFloat(mgdgrper[0]);
		float good = Float.parseFloat(mgdgrper[1]);
		float great = Float.parseFloat(mgdgrper[2]);
		float perfect = Float.parseFloat(mgdgrper[3]);
		
		System.out.println(miss+"+"+good+"+"+great+"+"+perfect);
		
		float sum = miss+good+great+perfect;
		
		float p_m = (miss/sum)*100;
		float p_gd = (good/sum)*100;
		float p_gr = (great/sum)*100;
		float p_per = (perfect/sum)*100;
		
		String spm = String.format("%.1f", p_m);
		String spgd = String.format("%.1f", p_gd);
		String spgr = String.format("%.1f", p_gr);
		String spper = String.format("%.1f", p_per);
		
		String grade = null;
		
		if(score1>=75) {
			grade="A";
		}else if(score1>=50) {
			grade="B";
		}else if(score1>=25) {
			grade="C";
		}else {
			grade="F";
		}
		
		System.out.println(score1);
		
		response.sendRedirect("resultScreen.jsp?score="+score1+"&grade="+grade+"&pmgdgrper="+spm+"/"+spgd+"/"+spgr+"/"+spper);
		
	}

}
