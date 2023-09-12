package com.sw.command;

import com.sw.dto.*;
import java.util.ArrayList;
import java.sql.Date;

public interface UserService {

	void home(SurveyDto[] dto);
	void register(MemberDto dto);
	int login(MemberDto dto,String id, String pw);
	ArrayList tsurveys(ArrayList<SurveyDto> dto, int mind);
	void search(ArrayList<SurveyDto> dto, String content);
	int squestion(ArrayList<SquestionDto> sqdto, SurveyDto dto, String title, int mind);
	void submitsurvey(SparticipationDto spdto,int i,int totalques);
	ArrayList qpinfo(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect,int mind, ArrayList<Integer> comqpselect);
	void submitqp(int mind,int qind,int selection,Date pdate);
	int identify(String pw,int mind);
	void modify(String pw, int mind);
	void withdrawal(int mind);
	void inquiry(ArrayList<InquiryDto> indto, int mind);
	void reinquiry(int mind, Date redate, String coninquiry);
	void inquirydelete(int iqind);
	void lookanswer(InquiryDto inqdto, int iqind);
	void myqp(ArrayList<QpDto> qpdto, ArrayList<QpselectDto> qpselect, ArrayList<QpcpcountDto> qpc, int mind, ArrayList<Integer> point);
	void qpdelete(int qind);
	void qpregister(int mind, String qpques, String qpimg, Date redate, Date dl, String op1, String op2, String op3, String op4);
	
}
