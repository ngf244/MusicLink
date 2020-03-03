package planner.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import planner.model.service.PlannerService;

/**
 * Servlet implementation class InsertPlannerGradeServlet
 */
@WebServlet("/update.pgrd")
public class UpdatePlannerGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePlannerGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpCode = request.getParameter("cpCode");
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		PlannerService service = new PlannerService();
		
		int nowGrade = service.selectPlannerGrade(cpCode);
		int totalGrade = 0;
		int result = 0;
		
		if(nowGrade == 0) {
			result = service.updatePlannerGrade(cpCode, grade);
		} else {
			totalGrade = (nowGrade + grade)/2; 
			result = service.updatePlannerGrade(cpCode, totalGrade);
		}
		
		String page = null;
		if(result > 0) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입력 완료!");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "평점 입력에 실패하였습니다.");
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
