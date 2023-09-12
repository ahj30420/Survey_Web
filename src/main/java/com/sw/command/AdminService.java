package com.sw.command;

import java.util.ArrayList;
import java.sql.Date;
import com.sw.dto.*;

public interface AdminService {

	int ad_login(MemberDto dto,String id, String pw);
	void ad_user(ArrayList<MemberDto>dto);
	void ad_user_point(ArrayList<SurveyDto> sdto, ArrayList<Date> pdate, int mind);
	void ad_user_sanswer(int mind, int sind, ArrayList<SparticipationDto> spdto, ArrayList<SquestionDto> sqdto);
	void ad_ad(ArrayList<MemberDto>dto);
	void ad_inquiry(ArrayList<InquiryDto>dto, ArrayList<String>name);
	void ad_reanswer(int iqind,int admind, String answer, Date redate);
	void ad_survey(ArrayList<SurveyDto> dto);
	int resurvey(SurveyDto dto);
	void resquestion(int sind, ArrayList<SquestionDto> sqdto);
	void sdelete(int sind);
	void ad_qp(ArrayList<QpDto> dto, ArrayList<String> id);
	void qpdelete(int qind);
	void ad_an_survey(ArrayList<AnsurveyDto> dto);
	void ad_an_survey_num(int sind,ArrayList<Ansurveynum> asn);
	void ad_an_survey_det(int sind, ArrayList<AnsurveydetDto> asddto,ArrayList<String> question);
	void ad_an_qp(ArrayList<AnqpDto> dto);
	void ad_an_qp_num(int qind,ArrayList<AnqpnumDto> aqn);
	void ad_an_qp_det(int qind,ArrayList<AnqpdetDto> aqd);
	
}
