package planner.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import planner.model.service.PlannerService;
import planner.model.vo.Planner;

/**
 * Servlet implementation class InsertPlannerServlet
 */
@WebServlet("/insert.pn")
public class InsertPlannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPlannerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userCode = request.getParameter("userCode");
		String cpName = request.getParameter("companyName");
		String cpAddress = request.getParameter("companyAddress");
		String cpPhone = request.getParameter("companyPhone");
		
		Planner pn = new Planner(userCode, cpName, cpAddress, cpPhone);
		int result = new PlannerService().insertPlanner(pn);
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "행사기획자 등록에 실패하였습니다.");
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
