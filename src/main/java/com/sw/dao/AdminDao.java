package com.sw.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.sw.dto.AnqpDto;
import com.sw.dto.AnqpdetDto;
import com.sw.dto.AnqpnumDto;
import com.sw.dto.AnsurveyDto;
import com.sw.dto.AnsurveydetDto;
import com.sw.dto.Ansurveynum;
import com.sw.dto.InquiryDto;
import com.sw.dto.MemberDto;
import com.sw.dto.QpDto;
import com.sw.dto.SparticipationDto;
import com.sw.dto.SquestionDto;
import com.sw.dto.SurveyDto;

public interface AdminDao {

	public int ad_login(MemberDto dto,String id, String pw);
	public void ad_user(ArrayList<MemberDto>dto);
	public void ad_user_point(ArrayList<SurveyDto> sdto, ArrayList<Date> pdate, int mind);
	public void ad_user_sanswer(int mind, int sind, ArrayList<SparticipationDto> spdto, ArrayList<SquestionDto> sqdto);
	public void ad_ad(ArrayList<MemberDto>dto);
	public void ad_inquiry(ArrayList<InquiryDto>dto, ArrayList<String>name);
	public void ad_reanswer(int iqind,int admind, String answer, Date redate);
	public void ad_survey(ArrayList<SurveyDto> dto);
	public int resurvey(SurveyDto dto);
	public void resquestion(int sind,ArrayList<SquestionDto> sqdto);
	public void sdelete(int sind);
	public void ad_qp(ArrayList<QpDto> dto, ArrayList<String> id);
	public void qpdelete(int qind);
	public void ad_an_survey(ArrayList<AnsurveyDto> dto);
	public void ad_an_survey_num(int sind,ArrayList<Ansurveynum> asn);
	public void ad_an_survey_det(int sind, ArrayList<AnsurveydetDto> asddto,ArrayList<String> question);
	public void ad_an_qp(ArrayList<AnqpDto> dto);
	public void ad_an_qp_num(int qind,ArrayList<AnqpnumDto> aqn);
	public void ad_an_qp_det(int qind,ArrayList<AnqpdetDto> aqd);
	
}
