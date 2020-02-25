package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.ManagerDAO;
import member.model.vo.Manager;

public class ManagerService {

	public Manager loginManager(Manager manager) {
		Connection conn = getConnection();
		
		Manager loginManager = new ManagerDAO().loginManager(conn, manager);
		
		close(conn);
		return loginManager;
	}

}
