package authorPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authorPage.model.service.AuthorService;
import member.model.vo.Member;

/**
 * Servlet implementation class showUserDetail
 */
@WebServlet("/showUserDetail.au")
public class showUserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showUserDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		int type = new AuthorService().checkUserClass(userId);
		System.out.println(type);
		
		Member mem = new AuthorService().selectUser(userId);
		
		String img = null;
		if(type == 2) {
			String imgPath = new AuthorService().getPicture(userId);
			img = imgPath.substring(imgPath.length()-19, imgPath.length());
		}
		String path = "views/authorPage/showUserDetail.jsp";
		
		request.setAttribute("type", type);
		request.setAttribute("mem", mem);
		request.setAttribute("img", img);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
