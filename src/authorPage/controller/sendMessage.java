package authorPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authorPage.model.service.AuthorService;

/**
 * Servlet implementation class sendMessage
 */
@WebServlet("/send.message")
public class sendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("message");
		String userCode = request.getParameter("userCode");
		
		int result = new AuthorService().sendMessage(message, userCode);
		int result2 = new AuthorService().deleteRequset(userCode);
		
		if(result > 0 && result2 > 0) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("메세지 전송 성공");
		} else {
			System.out.println("메세지 전송 실패");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
