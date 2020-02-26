package planner.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.MemberDAO;
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

}
