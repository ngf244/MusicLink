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

/**
 * Servlet implementation class FAQUpdateServlet
 */
@WebServlet("/update.faq")
public class FAQUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String faqCode = request.getParameter("code");
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		System.out.println("faqCode(update):"+faqCode);
		
		FAQ faq = new FAQ();
		faq.setFaqNum(faqCode);
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		
		int result = new FAQService().updateFAQ(faq);
		
		String page = null;
		if(result > 0) {
			page = "/list.faq";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "FAQ 수정에 실패하였습니다.");
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
