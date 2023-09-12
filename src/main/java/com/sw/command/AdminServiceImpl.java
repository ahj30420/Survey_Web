package com.sw.command;

import java.util.ArrayList;
import java.sql.Date;
import com.sw.dao.*;
import com.sw.dto.*;

public class AdminServiceImpl implements AdminService {

	public int ad_login(MemberDto dto,String id, String pw) {
		AdminDao dao = new AdminDaoImpl();
		return dao.ad_login(dto,id,pw);
	}
	
	public void ad_user(ArrayList<MemberDto>dto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_user(dto);
	}
	
	public void ad_user_point(ArrayList<SurveyDto> sdto, ArrayList<Date> pdate, int mind) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_user_point(sdto,pdate,mind);
	}
	
	public void ad_user_sanswer(int mind, int sind, ArrayList<SparticipationDto> spdto, ArrayList<SquestionDto> sqdto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_user_sanswer(mind,sind,spdto,sqdto);
	}
	
	public void ad_ad(ArrayList<MemberDto>dto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_ad(dto);
	}
	
	public void ad_inquiry(ArrayList<InquiryDto>dto, ArrayList<String>name) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_inquiry(dto,name);
	}
	
	public void ad_reanswer(int iqind,int admind, String answer, Date redate) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_reanswer(iqind,admind,answer,redate);
	}
	
	public void ad_survey(ArrayList<SurveyDto> dto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_survey(dto);
	}
	
	public int resurvey(SurveyDto dto) {
		AdminDao dao = new AdminDaoImpl();
		return dao.resurvey(dto);
	}
	
	public void resquestion(int sind, ArrayList<SquestionDto> sqdto) {
		AdminDao dao = new AdminDaoImpl();
		dao.resquestion(sind,sqdto);
	}
	
	public void sdelete(int sind) {
		AdminDao dao = new AdminDaoImpl();
		dao.sdelete(sind);
	}
	
	public void ad_qp(ArrayList<QpDto> dto, ArrayList<String> id) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_qp(dto,id);
	}
	
	public void qpdelete(int qind) {
		AdminDao dao = new AdminDaoImpl();
		dao.qpdelete(qind);
	}
	
	public void ad_an_survey(ArrayList<AnsurveyDto> dto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_survey(dto);
	}
	
	public void ad_an_survey_num(int sind,ArrayList<Ansurveynum> asn) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_survey_num(sind,asn);
	}
	
	public void ad_an_survey_det(int sind, ArrayList<AnsurveydetDto> asddto,ArrayList<String> question) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_survey_det(sind,asddto,question);
	}
	
	public void ad_an_qp(ArrayList<AnqpDto> dto) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_qp(dto);
	}
	
	public void ad_an_qp_num(int qind,ArrayList<AnqpnumDto> aqn) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_qp_num(qind,aqn);
	}
	
	
	public void ad_an_qp_det(int qind,ArrayList<AnqpdetDto> aqd) {
		AdminDao dao = new AdminDaoImpl();
		dao.ad_an_qp_det(qind,aqd);
	}
}
