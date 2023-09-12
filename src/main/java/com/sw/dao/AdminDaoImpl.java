package com.sw.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import com.sw.dto.*;

public class AdminDaoImpl implements AdminDao {
	
	public int ad_login(MemberDto dto,String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where role = '관리자'";
		
		int ind;
		String name;
		int phone;
		String email;
		int point;
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("id").equals(id) && rs.getString("pw").equals(pw)) {
					ind=rs.getInt("mind");
					name=rs.getString("name");
					phone=rs.getInt("phone");
					email=rs.getString("email");
					point=rs.getInt("point"); 
					
					dto.setInd(ind);
					dto.setEmail(email);
					dto.setName(name);
					dto.setPhone(phone);
					dto.setPoint(point);
					
					result = 1;
				}
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
		
		return result;
	}
	
	public void ad_user(ArrayList<MemberDto>dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where role = '사용자'";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mind = rs.getInt("mind");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int phone = rs.getInt("phone");
				int point = rs.getInt("point");
				Date redate = rs.getDate("redate");
				String email = rs.getString("email");
				
				MemberDto mdto = new MemberDto(mind,id,pw,name,phone,email,"사용자",point,redate);
				dto.add(mdto);
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_user_point(ArrayList<SurveyDto> sdto, ArrayList<Date> pdate, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select distinct sind, pdate from sparticipation where mind = ?";
		String sql2 = "select sind,title,point from survey where sind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int sind = rs.getInt("sind");
				Date date = rs.getDate("pdate");
				
				pdate.add(date);
				
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, sind);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					String title = rs2.getString("title");
					int point = rs2.getInt("point");
					
					SurveyDto dto = new SurveyDto(sind,title,null,null,null,null,point);
					sdto.add(dto);
				}
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,null);
		}
	}
	
	public void ad_user_sanswer(int mind, int sind, ArrayList<SparticipationDto> spdto, ArrayList<SquestionDto> sqdto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select numques, numselect from sparticipation where sind = ? and mind = ?";
		String sql2 = "select distinct question, conselect from squestion where sind = ? and numques = ? and numselect = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sind);
			pstmt.setInt(2, mind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int numques = rs.getInt("numques");
				int numselect = rs.getInt("numselect");
				
				SparticipationDto pdto = new SparticipationDto(mind,sind,numques,numselect,null);
				spdto.add(pdto);
				
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, sind);
				pstmt2.setInt(2, numques);
				pstmt2.setInt(3, numselect);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					String question = rs2.getString("question");
					String conselect = rs2.getString("conselect");
					
					SquestionDto qdto = new SquestionDto(sind,numques,question,numselect,conselect);
					sqdto.add(qdto);
				}
				
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,null);
		}
	}
	
	public void ad_ad(ArrayList<MemberDto>dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where role='관리자'";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mind = rs.getInt("mind");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String email = rs.getString("email");
				Date redate = rs.getDate("redate");
				
				MemberDto mdto = new MemberDto(mind,id,null,name,0,email,null,0,redate);
				dto.add(mdto);
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_inquiry(ArrayList<InquiryDto>dto, ArrayList<String>name) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select * from inquiry";
		String sql2 = "select name from member where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int iqind = rs.getInt("iqind");
				int mind = rs.getInt("mind");
				Date redate = rs.getDate("redate");
				String coninquiry = rs.getString("coninquiry");
				int ansmind = rs.getInt("ansmind");
				Date ansdate = rs.getDate("ansdate");
				String conanswer = rs.getString("conanswer");
				String status = rs.getString("status");
				
				InquiryDto inqdto = new InquiryDto(iqind,mind,redate,coninquiry,ansmind,ansdate,conanswer,status);
				dto.add(inqdto);
				
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, mind);
				rs2 = pstmt2.executeQuery();
				while(rs2.next()) {
					String n = rs2.getString("name");
					name.add(n);
				}
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_reanswer(int iqind,int admind, String answer, Date redate) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update inquiry set ansmind=?, ansdate=?, conanswer=?, status='답변완료' where iqind=?";
		
		System.out.println(iqind);
		System.out.println(admind);
		System.out.println(answer);
		System.out.println(redate);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, admind);
			pstmt.setDate(2, redate);
			pstmt.setString(3, answer);
			pstmt.setInt(4, iqind);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_survey(ArrayList<SurveyDto> dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from survey";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int sind = rs.getInt("sind");
				String title = rs.getString("Title");
				String image = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				int point = rs.getInt("point");
				
				SurveyDto sdto = new SurveyDto(sind,title,null,image,redate,deadline,point);
				dto.add(sdto);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public int resurvey(SurveyDto dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String sql = "insert into survey values(?,?,?,?,?,?,?)";
		String sql2 = "select sind from survey where title = ?";
		String img = "./image/"+dto.getImg();
		int sind = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getStitle());
			pstmt.setString(4, img);
			pstmt.setDate(5, dto.getRedate());
			pstmt.setDate(6, dto.getDeadline());
			pstmt.setInt(7, dto.getPoint());
			pstmt.executeUpdate();
			
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, dto.getTitle());
			rs = pstmt2.executeQuery();
			
			while(rs.next()) {
				sind = rs.getInt("sind");
			}		
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(null,pstmt,con);
			closeConnection(rs,pstmt2,null);
		}
		
		return sind;
	}
	
	public void resquestion(int sind, ArrayList<SquestionDto> sqdto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into squestion values(?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < sqdto.size(); i++) {
				int numques = sqdto.get(i).getNumques();
				String question = sqdto.get(i).getQuestion();
				int numselect = sqdto.get(i).getNumselect();
				String conselect = sqdto.get(i).getConselect();
				
				pstmt.setInt(1, sind);
				pstmt.setInt(2, numques);
				pstmt.setString(3, question);
				pstmt.setInt(4, numselect);
				pstmt.setString(5, conselect);
				pstmt.executeUpdate();
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void sdelete(int sind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from survey where sind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sind);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_qp(ArrayList<QpDto> dto, ArrayList<String> id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select * from qp";
		String sql2 = "select id from member where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qind = rs.getInt("qind");
				int mind = rs.getInt("mind");
				String question = rs.getString("question");
				String image = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				
				QpDto qdto = new QpDto(qind,mind,question,image,redate,deadline);
				dto.add(qdto);
				
				pstmt2.setInt(1, mind);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					String mid  = rs2.getString("id");
					id.add(mid);
				}
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,null);
		}
	}
	
	public void qpdelete(int qind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from qp where qind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qind);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_an_survey(ArrayList<AnsurveyDto> dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select s.sind as sind, s.title as title, count(s.sind) as psnum from (select sv.sind, sv.title, sp.mind from survey as sv, sparticipation as sp where sv.sind = sp.sind group by sv.sind,sp.mind) as s group by s.sind";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int sind = rs.getInt("sind");
				String title = rs.getString("title");
				int psnum = rs.getInt("psnum");
				
				AnsurveyDto asdto = new AnsurveyDto(sind,title,psnum);
				dto.add(asdto);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_an_survey_num(int sind, ArrayList<Ansurveynum> asn) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m.mind, m.id, sp.pdate from member as m, sparticipation as sp where m.mind = sp.mind and sp.sind = ? group by m.mind order by pdate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mind = rs.getInt("mind");
				String id = rs.getString("id");
				Date pdate = rs.getDate("pdate");
				
				Ansurveynum asndto = new Ansurveynum(mind,id,pdate);
				asn.add(asndto);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_an_survey_det(int sind, ArrayList<AnsurveydetDto> asddto,ArrayList<String> question) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select s.sind, s.numques, s.question, s.numselect, s.conselect, count(sp.mind) as count "
				+ "	from (select sq.sind, sq.numques, sq.question, sq.numselect, sq.conselect from squestion as sq where sind = ?) as s "
				+ "left join sparticipation as sp "
				+ "on s.sind = sp.sind and sp.numques = s.numques and s.numselect = sp.numselect "
				+ "group by s.conselect "
				+ "order by s.numques, s.numselect";
		String sql2 = "select sq.sind, sq.numques, sq.question from squestion as sq where sind = ? group by sq.numques order by numques";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			pstmt.setInt(1, sind);
			pstmt2.setInt(1, sind);
			rs = pstmt.executeQuery();
			rs2 = pstmt2.executeQuery();
			
			while(rs.next()) {
				int numques = rs.getInt("numques");
				String ques1 = rs.getString("question");
				int numselect = rs.getInt("numselect");
				String conselect = rs.getString("conselect");
				int count = rs.getInt("count");
				
				AnsurveydetDto dto = new AnsurveydetDto(numques,ques1,numselect,conselect,count);
				asddto.add(dto);
			}
			
			while(rs2.next()) {
				String ques = rs2.getString("question");
				question.add(ques);
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,null);
		}
	}
	public void ad_an_qp(ArrayList<AnqpDto> dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select qc.qind, qp.question, count(qc.mind) as count from qparticipation as qc left join qp on qc.qind = qp.qind group by qind;";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qind = rs.getInt("qind");
				String question = rs.getString("question");
				int count = rs.getInt("count");
				
				AnqpDto aqpdto = new AnqpDto(qind,question,count);
				dto.add(aqpdto);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_an_qp_num(int qind,ArrayList<AnqpnumDto> aqn) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select q.mind, q.id, q.pdate from (select qc.qind, qc.mind, m.id, qc.pdate from qparticipation as qc left join member as m on qc.mind = m.mind) as q where q.qind = ? order by pdate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mind = rs.getInt("mind");
				String id = rs.getString("id");
				Date pdate = rs.getDate("pdate");
				
				AnqpnumDto dto = new AnqpnumDto(mind,id,pdate);
				aqn.add(dto);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void ad_an_qp_det(int qind,ArrayList<AnqpdetDto> aqd) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select q.numselect, q.conselect, q.count from (select qs.qind, qs.numselect, qs.conselect, count(qc.mind) as count from qpselect as qs left join qparticipation as qc on qs.qind = qc.qind and qs.numselect = qc.selection group by qs.conselect order by qs.qind,qs.numselect) as q where qind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int numselect = rs.getInt("numselect");
				String conselect = rs.getString("conselect");
				int count = rs.getInt("count");
				
				AnqpdetDto dto = new AnqpdetDto(numselect,conselect,count);
				aqd.add(dto);
			}			
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("JDBC driver load success");
		}
		catch(ClassNotFoundException e) {
			 e.printStackTrace();
	         System.out.println("JDBC driver load fail");
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hsp_db?useSSL=false", 
			          "root","z30420qwas");
			System.out.println("DB connect success");
		}
		catch(SQLException e) {
			System.out.println("connect fail");
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(pstmt!=null)
		{
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(con!=null)
		{
			try {
				con.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
	}
	
}
