package artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import artist.model.service.ArtistService;

/**
 * Servlet implementation class SendLoveCall
 */
@WebServlet("/sendLoveCall.send")
public class SendLoveCall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendLoveCall() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String artistCode = request.getParameter("artistCode");
		String fesCode = request.getParameter("fesCode");
		String message = request.getParameter("message");
		System.out.println(artistCode);
		System.out.println(fesCode);
		System.out.println(message);
		
		int result = new ArtistService().insertLoveCall(artistCode, fesCode, message);
		
		if(result>0) {
			System.out.println("러브콜 전송 성공");
		} else {
			System.out.println("러브콜 전송 실패 ㅅㅂ");
		}
		
		response.getWriter().println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
