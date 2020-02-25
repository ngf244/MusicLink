package authorPage.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import authorPage.model.service.AuthorService;
import member.model.vo.Member;

/**
 * Servlet implementation class showUserDetail_recovery
 */
@WebServlet("/showUserDetail.rec")
public class showUserDetail_recovery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showUserDetail_recovery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("searchId");
		
		int type = new AuthorService().checkUserClass(userId);
		
		Member mem = new AuthorService().selectUser(userId);
		
		String img = null;
		if(type == 2) {
			String imgPath = new AuthorService().getPicture(userId);
			img = imgPath.substring(imgPath.length()-19, imgPath.length());
		}
		
		mem.setUserEmail(img); // img경로 임시로 email에 집어넣음
		mem.setUserClass(Integer.toString(type)); // type를 userClass에 집어넣음
		
		String userCode = new AuthorService().getUserCode(userId);
		
		ArrayList<String> arr = new AuthorService().getBanReason(userCode);
		System.out.println(arr.size());
		
		if(arr.size() != 0) {
			mem.setUserBirth(arr.get(0));
			mem.setUserGender(arr.get(1));
		} else {
		}
		
		if(mem.getUserEmail()==null) {
			System.out.println("null 맞앙 ㅎㅎ");
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mem, response.getWriter());
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
