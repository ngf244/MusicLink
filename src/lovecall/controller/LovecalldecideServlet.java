package lovecall.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lovecall.model.service.LoveCallService;

/**
 * Servlet implementation class LovecalldecideServlet
 */
@WebServlet("/lovecall.de")
public class LovecalldecideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LovecalldecideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lcCode = request.getParameter("lcCode");
		String atCode = request.getParameter("atCode");
		String fesCode = request.getParameter("fesCode");
		String yn = request.getParameter("yn");
		String letter = "";
		int result = 0;
		switch(yn) {
		case "Y" : letter = "Y"; result = new LoveCallService().acceptLoveCall(lcCode, letter, atCode, fesCode); break;
		case "N" : letter = "I"; result = new LoveCallService().acceptLoveCall(lcCode, letter, atCode, fesCode); break;
		}
		String page = "";
		String msg = "러브콜 뭐시기";
		if(result > 0) {
			page = "lcreceive.me";
		}else {
			request.setAttribute("msg", msg);
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
