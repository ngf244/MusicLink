package faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FAQService;
import faq.model.vo.FAQ;
import member.model.vo.Manager;

/**
 * Servlet implementation class FAQInsertServlet
 */
@WebServlet("/insert.faq")
public class FAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String mnCode = ((Manager)request.getSession().getAttribute("loginManager")).getMnCode();
		
		FAQ faq = new FAQ(title, content, mnCode);
		faq.setFaqTitle(title);
		faq.setFaqContent(content);
		faq.setMnCode(mnCode);
		
		int result = new FAQService().insertFAQ(faq);
		
		response.setContentType("text/html; charset=UTF-8");
		if(result > 0) {
			response.sendRedirect("list.faq");
		} else {
			request.setAttribute("msg", "FAQ 등록에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
