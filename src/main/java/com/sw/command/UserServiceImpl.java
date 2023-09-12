package com.sw.command;

import com.sw.dto.*;
import com.sw.dao.*;
import java.util.ArrayList;
import java.sql.Date;

public class UserServiceImpl implements UserService {

	public void home(SurveyDto[] dto) {
		UserDao dao = new UserDaoImpl();
		dao.home(dto);
	}
	
	public void register(MemberDto dto) {
		UserDao dao = new UserDaoImpl();
		dao.register(dto);
	}
	
	public int login(MemberDto dto, String id, String pw) {
		UserDao dao = new UserDaoImpl();
		return dao.login(dto,id,pw);
	}
	
	public ArrayList tsurveys(ArrayList<SurveyDto> dto, int mind) {
		UserDao dao = new UserDaoImpl();
		ArrayList<Integer> comsind = dao.tsurveys(dto, mind);
		return  comsind;
	}
	
	public void search(ArrayList<SurveyDto> dto, String content) {
		UserDao dao = new UserDaoImpl();
		dao.search(dto,content);
	}
	
	public int squestion(ArrayList<SquestionDto> sqdto, SurveyDto dto, String title, int mind) {
		UserDao dao = new UserDaoImpl();
		return dao.squestion(sqdto,dto,title, mind);
	}
	
	public void submitsurvey(SparticipationDto spdto,int i ,int totalques) {
		UserDao dao = new UserDaoImpl();
		dao.submitsurvey(spdto,i,totalques);
	}
	
	public ArrayList qpinfo(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect,int mind, ArrayList<Integer> comqpselect) {
		UserDao dao = new UserDaoImpl();
		return dao.qpinfo(qpdto,qpselect,mind, comqpselect);
	}
	
	public void submitqp(int mind,int qind,int selection,Date pdate) {
		UserDao dao = new UserDaoImpl();
		dao.submitqp(mind,qind,selection,pdate);
	}
	
	public int identify(String pw, int mind) {
		UserDao dao = new UserDaoImpl();
		return dao.identify(pw, mind);
	}
	
	public void modify(String pw, int mind) {
		UserDao dao = new UserDaoImpl();
		dao.modify(pw, mind);
	}
	
	public void withdrawal(int mind) {
		UserDao dao = new UserDaoImpl();
		dao.withdrawal(mind);
	}
	
	public void inquiry(ArrayList<InquiryDto> indto, int mind) {
		UserDao dao = new UserDaoImpl();
		dao.inquiry(indto,mind);
	}
	
	public void reinquiry(int mind, Date redate, String coninquiry) {
		UserDao dao = new UserDaoImpl();
		dao.reinquiry(mind,redate,coninquiry);
	}
	
	public void inquirydelete(int iqind) {
		UserDao dao = new UserDaoImpl();
		dao.inquirydelete(iqind);
	}
	
	public void lookanswer(InquiryDto inqdto, int iqind) {
		UserDao dao = new UserDaoImpl();
		dao.lookanswer(inqdto,iqind);
	}
	
	public void myqp(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect, ArrayList<QpcpcountDto> qpc, int mind, ArrayList<Integer> point) {
		UserDao dao = new UserDaoImpl();
		dao.myqp(qpdto,qpselect,qpc,mind,point);
	}
	
	public void qpdelete(int qind) {
		UserDao dao = new UserDaoImpl();
		dao.qpdelete(qind);
	}
	
	public void qpregister(int mind, String qpques, String qpimg, Date redate, Date qpdl, String op1, String op2, String op3, String op4){
		UserDao dao = new UserDaoImpl();
		dao.qpregister(mind,qpques,qpimg,redate,qpdl,op1,op2,op3,op4);
	}
	
}
