package com.sw.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sw.dto.*;

public class UserDaoImpl implements UserDao {

	public void home(SurveyDto[] dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select title,stitle,image from Survey order by redate desc limit 8";
		
		String title;
		String stitle;
		String image;
		int i = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				title = rs.getString("title");
				stitle = rs.getString("stitle");
				image = rs.getString("image");
				
				dto[i].setTitle(title);
				dto[i].setStitle(stitle);
				dto[i].setImg(image);
				i++;
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException error.");
	        e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void register(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getName();
		String email = dto.getEmail();
		int phone = dto.getPhone();
		Date redate = dto.getRedate();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,0);
			pstmt.setString(2,id);
			pstmt.setString(3,pw);
			pstmt.setString(4, name);
			pstmt.setInt(5, phone);
			pstmt.setString(6, email);
			pstmt.setString(7, "사용자");
			pstmt.setInt(8, 0);
			pstmt.setDate(9, redate);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("SQLException error.");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
		
	}
	
	public int login(MemberDto dto, String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select * from member where id=? and pw=?";
		
		int ind;
		String name;
		int phone;
		String email;
		int point;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
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
			System.out.println("SQLException error.");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
		return result;
	}
	
	public ArrayList tsurveys(ArrayList<SurveyDto> dto, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql = "select * from survey order by sind desc";
		String sql2 = "select distinct mind,sind from sparticipation where mind = ? order by sind desc";
		
		ArrayList<Integer> comsind = new ArrayList<Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int sind = rs.getInt("sind");
				String title = rs.getString("title");
				String stitle = rs.getString("stitle");
				String img = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				int point = rs.getInt("point");
				
				SurveyDto d = new SurveyDto(sind,title,stitle,img,redate,deadline,point);
				dto.add(d);
			}
			
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, mind);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				int sind = rs2.getInt("sind");
				comsind.add(sind);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException error.");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,con);
		}
		return comsind;
	}
	
	public void search(ArrayList<SurveyDto> dto, String content) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from survey where title like ? order by redate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,"%"+content+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String title = rs.getString("title");
				String stitle = rs.getString("stitle");
				String img = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				int point = rs.getInt("point");
				
				SurveyDto sd = new SurveyDto(0,title,stitle,img,redate,deadline,point);
				dto.add(sd);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public int squestion(ArrayList<SquestionDto> sqdto, SurveyDto dto, String title, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		String sql = "select sind, title, stitle, image, deadline from survey where title = ?";
		String sql2 = "select * from squestion where sind = ? order by numques,numselect";
		String sql3 = "select * from sparticipation where sind = ? and mind = ?";
		long miliseconds = System.currentTimeMillis();
		
		int sind = -1;
		String stitle=null;
		String img = null;
		Date dl = null;
		int result = 1;
		int count = 0;
		Date ndate = new Date(miliseconds);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sind = rs.getInt("sind");
				stitle = rs.getString("stitle");
				img = rs.getString("image");
				dl = rs.getDate("deadline");
			}
			
			dto.setInd(sind);
			dto.setStitle(stitle);
			dto.setImg(img);
			
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, sind);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				int numques = rs2.getInt("numques");
				String question = rs2.getString("question");
				int numselect = rs2.getInt("numselect");
				String conselect = rs2.getString("conselect");
				
				SquestionDto sd = new SquestionDto(sind, numques, question, numselect, conselect);
				sqdto.add(sd);
			}
			
			pstmt3 = con.prepareStatement(sql3);
			pstmt3.setInt(1, sind);
			pstmt3.setInt(2, mind);
			rs3 = pstmt3.executeQuery();
			
			while(rs3.next()) {
				count++;
			}
			System.out.println(count);
			if(count != 0) {
				result = -1;
			}
			if(ndate.after(dl)) {
				result = -1;
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,null);
			closeConnection(rs3,pstmt3,null);
		}
		return result;
	}
	
	public void submitsurvey(SparticipationDto spdto, int i , int totalques) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		int result = -1;
		String sql = "insert into sparticipation values(?,?,?,?,?)";
		String sql2 = "select point from survey where sind = ?";
		String sql3 = "update member set point = point+? where mind = ?";
		
		int mind = spdto.getMind();
		int sind = spdto.getSind();
		int numques = spdto.getNumques();
		int numselect = spdto.getNumselect();
		Date pdate = spdto.getPdate();
		int point = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			pstmt.setInt(2, sind);
			pstmt.setInt(3, numques);
			pstmt.setInt(4, numselect);
			pstmt.setDate(5, pdate);
			result = pstmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("sparticipation insert success!!");
			}
			else {
				System.out.println("sparticipation insert fail!!");
			}
			if(i == totalques) {
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1,sind);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					point = rs2.getInt("point");
				}
			
				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, point);
				pstmt3.setInt(2, mind);
				pstmt3.executeUpdate();
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,con);
			closeConnection(null,pstmt3,con);
		}
	}
	
	public ArrayList qpinfo(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect,int mind, ArrayList<Integer> comqpselect) {
		Connection con = getConnection();
		PreparedStatement pstmt0 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs0 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		String sql0 = "delete from qp where deadline < ?";
		String sql = "select * from qp order by qind desc";
		String sql2 = "select * from qpselect order by qind desc";
		String sql3 = "select distinct mind,qind,selection from qparticipation where mind = ? order by qind desc";
		long miliseconds = System.currentTimeMillis();
		Date pdate = new Date(miliseconds);
		ArrayList<Integer> comqp = new ArrayList<Integer>();
		
		try {
			pstmt0 = con.prepareStatement(sql0);
			pstmt0.setDate(1, pdate);
			pstmt0.executeUpdate();
			
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qind = rs.getInt("qind");
				int ind = rs.getInt("mind");
				String question = rs.getString("question");
				String image = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				
				QpDto dto = new QpDto(qind, ind, question, image, redate, deadline);
				qpdto.add(dto);
			}
			
			pstmt2 = con.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				int qind = rs2.getInt("qind");
				int numselect = rs2.getInt("numselect");
				String conselect = rs2.getString("conselect");
				
				QpselectDto qpsdto = new QpselectDto(qind,numselect,conselect);
				qpselect.add(qpsdto);
			}
			
			pstmt3 = con.prepareStatement(sql3);
			pstmt3.setInt(1, mind);
			rs3 = pstmt3.executeQuery();
			
			while(rs3.next()) {
				int qind = rs3.getInt("qind");
				int selection = rs3.getInt("selection");
				
				comqp.add(qind);
				comqpselect.add(selection);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs0,pstmt0,con);
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,con);
		}
		
		return comqp;
	}
	
	public void submitqp(int mind,int qind,int selection,Date pdate) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result=-1;
		String sql="insert into qparticipation values(?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			pstmt.setInt(2, qind);
			pstmt.setInt(3, selection);
			pstmt.setDate(4, pdate);
			result = pstmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("qparticipation success!!");
			}
			else {
				System.out.println("qparticipation success!!");
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException e");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs, pstmt, con);
		}
		
	}
	
	public int identify(String pw, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from member where mind = ?";
		String password = null;
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				password = rs.getString("pw");
			}
			
			if(password.equals(pw)) {
				result = 1;
			}
			
		}
		catch(SQLException e) {
			System.out.println("SQLException e");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
		
		return result;
	}
	
	public void modify(String pw, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update member set pw = ? where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, mind);
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
	
	public void withdrawal(int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from member where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
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
	
	public void inquiry(ArrayList<InquiryDto> indto, int mind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from inquiry where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int iqind = rs.getInt("iqind");
				Date redate = rs.getDate("redate");
				String coninquiry = rs.getString("coninquiry");
				int ansmind = rs.getInt("ansmind");
				Date ansdate = rs.getDate("ansdate");
				String conanswer = rs.getString("conanswer");
				String status = rs.getString("status");
				
				InquiryDto dto = new InquiryDto(iqind,mind,redate,coninquiry,ansmind,ansdate,conanswer,status);
				indto.add(dto);
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
	
	public void reinquiry(int mind, Date redate, String coninquiry) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into inquiry values(0, ?, ?, ?, -1, null, null, '답변대기')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mind);
			pstmt.setDate(2, redate);
			pstmt.setString(3, coninquiry);
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
	
	public void inquirydelete(int iqind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from inquiry where iqind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, iqind);
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
	
	public void lookanswer(InquiryDto inqdto, int iqind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from inquiry where iqind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, iqind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mind = rs.getInt("mind");
				Date redate = rs.getDate("redate");
				String coninquiry = rs.getString("coninquiry");
				int ansmind = rs.getInt("ansmind");
				Date ansdate = rs.getDate("ansdate");
				String conanswer = rs.getString("conanswer");
				String status = rs.getString("status");
				
				inqdto.setAnsdate(ansdate);
				inqdto.setAnsmind(ansmind);
				inqdto.setConanswer(conanswer);
				inqdto.setConinquiry(coninquiry);
				inqdto.setIqind(iqind);
				inqdto.setMind(ansmind);
				inqdto.setRedate(redate);
				inqdto.setStatus(status);
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
	
	public void myqp(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect, ArrayList<QpcpcountDto> qpc, int mind, ArrayList<Integer> point) {
		Connection con = getConnection();
		Connection con2 = getConnection();
		Connection con3 = getConnection();
		Connection con4 = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		String sql = "select * from qp where mind = ? order by qind desc";
		String sql2 = "select * from qpselect where qind = ?";
		String sql3 = "select qind, selection, count(selection) as cs from qparticipation where qind = ? group by selection";
		String sql4 = "select point from member where mind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt2 = con2.prepareStatement(sql2);
			pstmt3 = con3.prepareStatement(sql3);
			pstmt4 = con4.prepareStatement(sql4);
			pstmt.setInt(1, mind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qind = rs.getInt("qind");
				int ind = rs.getInt("mind");
				String question = rs.getString("question");
				String image = rs.getString("image");
				Date redate = rs.getDate("redate");
				Date deadline = rs.getDate("deadline");
				
				pstmt2.setInt(1, qind);
				rs2 = pstmt2.executeQuery();
				while(rs2.next()) {
					int numselect = rs2.getInt("numselect");
					String conselect = rs2.getString("conselect");
					
					QpselectDto selectdto = new QpselectDto(qind,numselect,conselect);
					qpselect.add(selectdto);
				}
				
				pstmt3.setInt(1, qind);
				rs3 = pstmt3.executeQuery();
				while(rs3.next()) {
					int selection = rs3.getInt("selection");
					int count = rs3.getInt("cs");
					
					QpcpcountDto pcpdto = new QpcpcountDto(qind,selection,count);
					qpc.add(pcpdto);
				}
				
				QpDto dto = new QpDto(qind, ind, question, image, redate, deadline);
				qpdto.add(dto);
			}
			pstmt4.setInt(1, mind);
			rs4 = pstmt4.executeQuery();
			while(rs4.next()) {
				int p = rs4.getInt("point");
				point.add(p);
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException e");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
			closeConnection(rs2,pstmt2,con2);
			closeConnection(rs3,pstmt3,con3);
		}
	}
	
	public void qpdelete(int qind) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from qp where qind = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,qind);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("SQLException e");
			e.printStackTrace();
		}
		finally {
			closeConnection(rs,pstmt,con);
		}
	}
	
	public void qpregister(int mind, String qpques, String qpimg, Date redate, Date qpdl, String op1, String op2, String op3, String op4) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String sql = "insert into qp values(?,?,?,?,?,?)";
		String sql2 = "select qind from qp order by qind desc";
		String sql3 = "insert into qpselect values(?,?,?)";
		int qind = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, mind);
			pstmt.setString(3, qpques);
			pstmt.setString(4, "./image/"+qpimg);
			pstmt.setDate(5, redate);
			pstmt.setDate(6, qpdl);
			pstmt.executeUpdate();
			
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			while(rs.next()) {
					qind = rs.getInt("qind");
					break;
			}
			
				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, qind);
				pstmt3.setInt(2, 1);
				pstmt3.setString(3,op1);
				pstmt3.executeUpdate();
				
				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, qind);
				pstmt3.setInt(2, 2);
				pstmt3.setString(3,op2);
				pstmt3.executeUpdate();
			
				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, qind);
				pstmt3.setInt(2, 3);
				pstmt3.setString(3,op3);
				pstmt3.executeUpdate();

				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, qind);
				pstmt3.setInt(2, 4);
				pstmt3.setString(3,op4);
				pstmt3.executeUpdate();
				
		}
		catch(SQLException e) {
			System.out.println("SQLException Error");
			e.printStackTrace();
		}
		finally {
			closeConnection(null,pstmt,con);
			closeConnection(rs,pstmt2,null);
			closeConnection(null,pstmt,null);
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
