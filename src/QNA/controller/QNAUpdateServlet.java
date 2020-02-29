package QNA.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QNA.model.service.QNAService;
import QNA.model.vo.QnA;

/**
 * Servlet implementation class QNAUpdateServlet
 */
@WebServlet("/update.qna")
public class QNAUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaCode = request.getParameter("qnaCode");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnA qna = new QnA();
		qna.setQnaCode(qnaCode);
		qna.setQnaTitle(title);
		qna.setQnaContent(content);
		
		int result = new QNAService().updateQnA(qna);
		
		String page = null;
		if(result > 0) {
			page = "/detail.qna?qnaCode="+qnaCode;
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
