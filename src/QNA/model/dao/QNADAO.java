package QNA.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import QNA.model.vo.QnA;

public class QNADAO {
	
	private Properties prop = new Properties();
	
	public QNADAO() {
		String fileName = QNADAO.class.getResource("/sql/qna/qna-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public ArrayList<QnA> selectList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QnA> list = null;
		
		int posts = 10; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		System.out.println("DAO(currentPage, startRow, endRow) : " + currentPage + "," + startRow + "," + endRow);
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<QnA>();
			
			System.out.println(rs.next());
			while(rs.next()) {
				QnA q = new QnA(rs.getString("qna_num"),
								rs.getString("qna_title"),
								rs.getString("qna_content"),
								rs.getString("qna_writer"),
								rs.getDate("qna_date"),
								rs.getString("qna_comment_yn"),
								rs.getString("qna_comment_content"),
								rs.getString("qna_status"),
								rs.getString("mn_code"),
								rs.getString("user_code"));
				list.add(q);
				System.out.println("list 카운트 ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		System.out.println("DAO(list.size) : " + list.size());
		return list;
	}

	public int insertQnA(Connection conn, QnA qna, String userId) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		ResultSet rs = null;
		
		String resultCode = null;
		String resultName = null;
		int result = 0;
		
		String query1 = prop.getProperty("selectUser");
		String query2 = prop.getProperty("insertQnA");
		
		try {
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setString(1, userId);
			
			rs = pstmt1.executeQuery();
			if(rs.next()) {
				resultCode = rs.getString("user_code");
				resultName = rs.getString("user_name");
			}
			
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setString(1, qna.getQnaTitle());
			pstmt2.setString(2, qna.getQnaContent());
			pstmt2.setString(3, resultName);
			pstmt2.setString(4, resultCode);
			
			result = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt1);
		}
		
		System.out.println("dao"+result);
		return result;
	}

	public QnA selectQnA(Connection conn, String qnaCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnA qna = null;
		
		String query = prop.getProperty("selectQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new QnA(rs.getString("qna_num"),
								rs.getString("qna_title"),
								rs.getString("qna_content"),
								rs.getString("qna_writer"),
								rs.getDate("qna_date"),
								rs.getString("qna_comment_yn"),
								rs.getString("qna_comment_content"),
								rs.getString("qna_status"),
								rs.getString("mn_code"),
								rs.getString("user_code"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return qna;
	}

	public int deleteQnA(Connection conn, String qnaCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("delectQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateQnA(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setString(3, qna.getQnaCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReply(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna.getQnaComContent());
			pstmt.setString(2, qna.getQnaCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<QnA> selectReplyList(Connection conn, String qnaCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QnA> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCode);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<QnA>();
			
			while(rs.next()) {
				list.add(new QnA(rs.getString("qna_num"),
								rs.getString("qna_title"),
								rs.getString("qna_content"),
								rs.getString("qna_writer"),
								rs.getDate("qna_date"),
								rs.getString("qna_comment_yn"),
								rs.getString("qna_comment_content"),
								rs.getString("qna_status"),
								rs.getString("mn_code"),
								rs.getString("user_code")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int getMyQNAListCount(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMyQNAListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<QnA> selectMyQNAList(Connection conn, int currentPage, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QnA> qList = null;
		int posts = 10; // 한페이지에 보여질 게시글 개수
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectMyQNAList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userCode);
			
			rset = pstmt.executeQuery();
			
			qList = new ArrayList<QnA>();
			
			while(rset.next()) {
				QnA q = new QnA(rset.getString("QNA_NUM"),
								rset.getString("QNA_TITLE"),
								rset.getString("QNA_CONTENT"),
								rset.getString("QNA_WRITER"),
								rset.getDate("QNA_DATE"),
								rset.getString("QNA_COMMENT_YN"),
								rset.getString("QNA_COMMENT_CONTENT"),
								rset.getString("QNA_STATUS"),
								rset.getString("MN_CODE"),
								rset.getString("USER_CODE"));
				qList.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qList;
	}

	public ArrayList<QnA> selectRecentMyQnAList(Connection conn, String userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QnA> qList = null;
		
		String query = prop.getProperty("selectRecentMyQnAList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userCode);
			rset = pstmt.executeQuery();
			
			qList = new ArrayList<QnA>();
			
			while(rset.next()) {
				QnA q = new QnA(rset.getString("QNA_NUM"),
								rset.getString("QNA_TITLE"),
								rset.getString("QNA_CONTENT"),
								rset.getString("QNA_WRITER"),
								rset.getDate("QNA_DATE"),
								rset.getString("QNA_COMMENT_YN"),
								rset.getString("QNA_COMMENT_CONTENT"),
								rset.getString("QNA_STATUS"),
								rset.getString("MN_CODE"),
								rset.getString("USER_CODE"));
				qList.add(q);
			}
			System.out.println("DAO에서 나의 최근 QNA리스트 찍어보기 : " + qList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qList;
	}

	public int deleteReply(Connection conn, String qnaCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateReply(Connection conn, String qnaCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}




}
