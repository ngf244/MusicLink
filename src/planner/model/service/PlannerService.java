package planner.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import planner.model.dao.PlannerDAO;
import planner.model.vo.Planner;

public class PlannerService {

	public int insertPlanner(String userCode, Planner pn) {
		Connection conn = getConnection();
		PlannerDAO pnDAO = new PlannerDAO();
		
		int result1 = pnDAO.insertPlanner(conn, pn);
		int result2 = pnDAO.insertPlReq(conn, userCode);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
	}

	public int updatePlannerGrade(String cpCode, int grade) {
		Connection conn = getConnection();
		int result = new PlannerDAO().updatePlannerGrade(conn, cpCode, grade);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int selectPlannerGrade(String cpCode) {
		Connection conn = getConnection();
		int nowGrade = new PlannerDAO().selectPlannerGrade(conn, cpCode);
		close(conn);
		return nowGrade;
	}

}
