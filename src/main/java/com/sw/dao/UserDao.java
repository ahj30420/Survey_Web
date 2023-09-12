package com.sw.dao;

import java.sql.Date;
import java.util.ArrayList;
import com.sw.dto.*;

public interface UserDao {

	public void home(SurveyDto[] dto);
	public void register(MemberDto dto);
	public int login(MemberDto dto, String id, String pw);
	public ArrayList tsurveys(ArrayList<SurveyDto> dto, int mind);
	public void search(ArrayList<SurveyDto> dto, String content);
	public int squestion(ArrayList<SquestionDto> sqdto, SurveyDto dto, String title, int mind);
	public void submitsurvey(SparticipationDto spdto,int i,int totalques);
	public ArrayList qpinfo(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect,int mind,ArrayList<Integer> comqpselect);
	public void submitqp(int mind,int qind,int selection,Date pdate);
	public int identify(String pw, int mind);
	public void modify(String pw, int mind);
	public void withdrawal(int mind);
	public void inquiry(ArrayList<InquiryDto> indto, int mind);
	public void reinquiry(int mind, Date redate, String coninquiry);
	public void inquirydelete(int iqind);
	public void lookanswer(InquiryDto inqdto, int iqind);
	public void myqp(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect, ArrayList<QpcpcountDto> qpc, int mind, ArrayList<Integer> point);
	public void qpdelete(int qind);
	public void qpregister(int mind, String qpques, String qpimg, Date redate, Date qpdl, String op1, String op2, String op3, String op4);
	
}
