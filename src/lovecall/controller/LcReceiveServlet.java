package lovecall.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lovecall.model.service.LoveCallService;
import lovecall.model.vo.LoveCall;
import member.model.vo.Member;

/**
 * Servlet implementation class LcReceiveServlet
 */
@WebServlet("/lcreceive.me")
public class LcReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LcReceiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		
		LoveCallService service = new LoveCallService();
		
		ArrayList<LoveCall> lvcList = service.selectLovecall(userCode);
		String page = null;
		
		System.out.println("러브콜 데이터 넘어옵니까?"+lvcList);
		
		if(lvcList != null) {
			request.setAttribute("lvcList", lvcList);
			page = "views/artist/LoveCallReceive.jsp";
		} else {
			request.setAttribute("msg", "러브콜 조회에실패하였습니다.");
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
