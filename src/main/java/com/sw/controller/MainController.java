package com.sw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.sql.Date;

import com.sw.command.*;
import com.sw.dto.*;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class MainController
 */
@WebServlet("*.do")
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;
		UserService uservice = new UserServiceImpl();
		AdminService adservice = new AdminServiceImpl();
		HttpSession session = request.getSession();
		
		System.out.println("actionDo - "+com);
		if(com.equals("/home.do")) {
			String img;
			String title;
			String stitle;
			
			SurveyDto[] surveydto = new SurveyDto[8];
			
			for(int i=0; i<8; i++) {
				surveydto[i] = new SurveyDto();
			}
			
			for(int i=0; i<8; i++){
				uservice.home(surveydto);
				
				img = surveydto[i].getImg();
				title = surveydto[i].getTitle();
				stitle = surveydto[i].getStitle();
				
				System.out.println(img);
				
				session.setAttribute("s_img"+i, img);
				session.setAttribute("s_title"+i, title);
				session.setAttribute("s_stitle"+i, stitle);
			}
			
			viewPage = "shomepage.jsp";
		}
		else if(com.equals("/register.do")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String cpw = request.getParameter("cpw");
			String email = request.getParameter("email");
			int phone = Integer.parseInt(request.getParameter("tel"));
			long miliseconds = System.currentTimeMillis();
			Date redate = new Date(miliseconds);
			
			if(pw.equals(cpw)) {
			MemberDto member = new MemberDto(0,id,pw,name,phone,email,"사용자",0,redate);
			uservice.register(member);
			
			viewPage = "slogin.jsp";
			}
			else {
				viewPage = "sregister.jsp";
			}
		}
		else if(com.equals("/login.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			int result = 0;
			
			MemberDto dto = new MemberDto();
			result = uservice.login(dto,id,pw);
			
			if(result == 1) {
				int ind = dto.getInd();
				String email = dto.getEmail();
				int phone = dto.getPhone();
				String name = dto.getName();
				int point = dto.getPoint();
				
				session.setAttribute("mind", ind);
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("phone", phone);
				session.setAttribute("point", point);
				
				viewPage="shomepage.jsp";
			}
			else {
				viewPage="slogin.jsp";
			}
		}
		else if(com.equals("/tsurveys.do")) {
			ArrayList<SurveyDto> dto = new ArrayList<SurveyDto>();
			ArrayList<Integer> comsind = new ArrayList<Integer>();
			int mind = (int)session.getAttribute("mind");
			comsind = uservice.tsurveys(dto,mind);
			session.setAttribute("tsurveys",dto);
			session.setAttribute("comsind",comsind);
			viewPage = "surveys.jsp";
		}
		else if(com.equals("/ogsurveys.do")) {
			ArrayList<SurveyDto> dto = (ArrayList)session.getAttribute("tsurveys");
			ArrayList<SurveyDto> re = new ArrayList<SurveyDto>();
            for(int i=0; i<dto.size(); i++){ 
            	long miliseconds = System.currentTimeMillis();
                Date date = new Date(miliseconds);
                boolean result = date.after(dto.get(i).getDeadline());
                	
                if(result){
                }
                else {
                	re.add(dto.get(i));
                }
            }
            session.setAttribute("ogsurveys",re);
            viewPage="ogsurveys.jsp";
		}
		else if(com.equals("/desurveys.do")) {
			ArrayList<SurveyDto> dto = (ArrayList)session.getAttribute("tsurveys");
			ArrayList<SurveyDto> re = new ArrayList<SurveyDto>();
            for(int i=0; i<dto.size(); i++){ 
            	long miliseconds = System.currentTimeMillis();
                Date date = new Date(miliseconds);
                boolean result = date.after(dto.get(i).getDeadline());
                	
                if(!result){
                }
                else {
                	re.add(dto.get(i));
                }
            }
            session.setAttribute("desurveys",re);
            viewPage="desurveys.jsp";
		}
		else if(com.equals("/comsurveys.do")) {
			ArrayList<SurveyDto> dto = (ArrayList)session.getAttribute("tsurveys");
			ArrayList<Integer> comsind = (ArrayList) session.getAttribute("comsind");
			ArrayList<SurveyDto> comdto = new ArrayList<SurveyDto>();
			for(int i = 0; i < dto.size(); i++) {
				for(int j =0; j < comsind.size(); j++) {
					if(comsind.get(j) == dto.get(i).getInd()) {
						SurveyDto cs = dto.get(i);
						comdto.add(cs);
					}
				}
			}
			session.setAttribute("comdto",comdto);
			viewPage = "comsurveys.jsp";
		}
		else if(com.equals("/search.do")) {
			ArrayList<SurveyDto> dto = new ArrayList<SurveyDto>();
			String content = request.getParameter("search");

			uservice.search(dto,content);
			session.setAttribute("search", dto);
			session.setAttribute("scontent", content);
			viewPage="search.jsp";
		}
		else if(com.equals("/contentsurvey.do")) {
			String title = request.getParameterValues("ti")[0];
			String stitle = null;
			String img = null;
			int mind = (int)session.getAttribute("mind");

			ArrayList<SquestionDto> sqdto = new ArrayList<SquestionDto>();
			SurveyDto dto = new SurveyDto();
		
			int result = uservice.squestion(sqdto,dto,title,mind);
			
			session.setAttribute("sqdto",sqdto);
			session.setAttribute("sind", dto.getInd());
			session.setAttribute("title", title);
			session.setAttribute("stitle", dto.getStitle());
			session.setAttribute("img", dto.getImg());
			if(result == 1) {
				viewPage="contentsurvey.jsp";
			}
			else {
				viewPage="home.do";
			}
		}
		else if(com.equals("/submitsurvey.do")) {
			ArrayList<SquestionDto> sqdto = (ArrayList) session.getAttribute("sqdto");
			int totalques = sqdto.get(sqdto.size()-1).getNumques();
			long miliseconds = System.currentTimeMillis();
			
			
			for(int i = 0; i < totalques; i++) {
				int mind = (int)session.getAttribute("mind");
				int sind = (int)session.getAttribute("sind");
				int numques = i+1;
				String ns = "op"+numques; 
				int numselect = Integer.parseInt(request.getParameter(ns));
				Date pdate = new Date(miliseconds);
				
				SparticipationDto sp = new SparticipationDto(mind,sind,numques,numselect,pdate);
				uservice.submitsurvey(sp,i,totalques-1);
			}
			
			viewPage = "tsurveys.do";
		}
		else if(com.equals("/qp.do")) {
			ArrayList<QpDto> qpdto = new ArrayList<QpDto>();
			ArrayList<QpselectDto> qpselect = new ArrayList<QpselectDto>();
			ArrayList<Integer> comqind = new ArrayList<Integer>();
			ArrayList<Integer> comqpselect = new ArrayList<Integer>();
			int mind = (int)session.getAttribute("mind");
			comqind = uservice.qpinfo(qpdto,qpselect,mind,comqpselect);
			session.setAttribute("qpdto",qpdto);
			session.setAttribute("qpselect",qpselect);
			session.setAttribute("comqind",comqind);
			session.setAttribute("comqpselection",comqpselect);
			viewPage="quickpoll.jsp";
		}
		else if(com.equals("/submitqp.do")) {
			long miliseconds = System.currentTimeMillis();
			
			String s = request.getParameter("op1");
			String[] sarr = s.split("/");
			int mind = (int)session.getAttribute("mind");
			int qind = Integer.parseInt(sarr[1]);
			int selection = Integer.parseInt(sarr[0]);
			Date pdate = new Date(miliseconds);
			
			uservice.submitqp(mind,qind,selection,pdate);
			viewPage="qp.do";
		}
		else if(com.equals("/identify.do")) {
			String pw = request.getParameter("password");
			int mind = (int)session.getAttribute("mind");
			int identify = uservice.identify(pw,mind);
			if(identify == 1) {
				viewPage = "modify2.jsp";
			}
			else {
				viewPage = "modify1.jsp";
			}
		}
		else if(com.equals("/modify.do")) {
			String pw = request.getParameter("pw");
			String cpw = request.getParameter("cpw");
			int mind = (int)session.getAttribute("mind");
			
			if(pw.equals(cpw)) {
				uservice.modify(pw,mind);
				viewPage="home.do";
			}
			else {
				viewPage="modify2.jsp";
			}
		}
		else if(com.equals("/withdrawal.do")) {
			int mind = (int)session.getAttribute("mind");
			uservice.withdrawal(mind);
			viewPage="slogout.jsp";
		}
		else if(com.equals("/inquiry.do")) {
			ArrayList<InquiryDto> indto = new ArrayList<InquiryDto>();
			int mind = (int)session.getAttribute("mind");
			uservice.inquiry(indto, mind);
			session.setAttribute("inqdto", indto);
			viewPage = "inquiry.jsp";
		}
		else if(com.equals("/reinquiry.do")) {
			long miliseconds = System.currentTimeMillis();
			String coninquiry = request.getParameter("coninquiry");
			int mind = (int)session.getAttribute("mind");
			Date redate = new Date(miliseconds);
			
			uservice.reinquiry(mind,redate,coninquiry);
			viewPage = "inquiry.do";
		}
		else if(com.equals("/inquirydelete.do")) {
			int iqind = Integer.parseInt(request.getParameterValues("delinquiry")[0]);
			uservice.inquirydelete(iqind);
			viewPage = "inquiry.do";
		}
		else if(com.equals("/lookanswer.do")) {
			int iqind = Integer.parseInt(request.getParameter("inquiryind"));
			InquiryDto inqdto = new InquiryDto();
			uservice.lookanswer(inqdto,iqind);
			session.setAttribute("answerinqdto", inqdto);
			viewPage = "answer_inquiry.jsp";
		}
		else if(com.equals("/smypage.do")) {
			ArrayList<QpDto> qpdto = new ArrayList<QpDto>();
			ArrayList<QpselectDto> qpselect = new ArrayList<QpselectDto>();
			ArrayList<QpcpcountDto> qpc = new ArrayList<QpcpcountDto>();
			ArrayList<Integer> point = new ArrayList<Integer>();
			int mind = (int)session.getAttribute("mind");
			uservice.myqp(qpdto,qpselect,qpc,mind,point);
			session.setAttribute("myqp", qpdto);
			session.setAttribute("myqpselect", qpselect);
			session.setAttribute("qpcount", qpc);
			session.setAttribute("point", point.get(0));
			viewPage = "smypage.jsp";
		}
		else if(com.equals("/qpdelete.do")) {
			int qind = Integer.parseInt(request.getParameterValues("qpdelete")[0]);
			uservice.qpdelete(qind);
			viewPage = "smypage.do";
		}
		else if(com.equals("/qpregister.do")) {
			
			String directory = "C:\\apache-tomcat-9.0.70-windows-x64\\apache-tomcat-9.0.70\\wtpwebapps\\HSP\\image";
			int maxSize = 1024*1024*100;
			String encoding = "UTF-8";
			
			MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,
					new DefaultFileRenamePolicy());
			
			long miliseconds = System.currentTimeMillis();
			
			int mind = (int) session.getAttribute("mind");
			String qpques = multipartRequest.getParameter("qpques");
			String qpimg = multipartRequest.getFilesystemName("qpimg");
			Date redate = new Date(miliseconds);
			Date qpdl = java.sql.Date.valueOf(multipartRequest.getParameter("qpdl"));
			
			String op1 = multipartRequest.getParameter("op1");
			String op2 = multipartRequest.getParameter("op2");
			String op3 = multipartRequest.getParameter("op3");
			String op4 = multipartRequest.getParameter("op4");
			
			uservice.qpregister(mind,qpques,qpimg,redate,qpdl,op1,op2,op3,op4);
			viewPage = "smypage.do";
		}
		else if(com.equals("/ad_login.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			int result = 0;
			
			MemberDto dto = new MemberDto();
			result = adservice.ad_login(dto,id,pw);
	
			if(result == 1) {
				int ind = dto.getInd();
				String email = dto.getEmail();
				int phone = dto.getPhone();
				String name = dto.getName();
				int point = dto.getPoint();
				
				session.setAttribute("ad_mind", ind);
				session.setAttribute("ad_id", id);
				session.setAttribute("ad_pw", pw);
				
				viewPage="ad_user.do";
			}
			else {
				viewPage="ad_login.jsp";
			}
		}
		
		else if(com.equals("/ad_user.do")) {
			ArrayList<MemberDto> dto = new ArrayList<MemberDto>();
			
			adservice.ad_user(dto);
			
			session.setAttribute("userinfo",dto);
			viewPage = "ad_user.jsp";
		}
		else if(com.equals("/ad_user_point.do")) {
			int mind = Integer.parseInt(request.getParameter("mind"));
			String name = request.getParameter("name");
			int point = Integer.parseInt(request.getParameter("point"));
			ArrayList<SurveyDto> sdto = new ArrayList<SurveyDto>();
			ArrayList<Date> pdate = new ArrayList<Date>();
			
			adservice.ad_user_point(sdto,pdate,mind);
			
			session.setAttribute("ad_user_survey", sdto);
			session.setAttribute("ad_user_survey_date", pdate);
			session.setAttribute("user_name", name);
			session.setAttribute("user_point",point);
			session.setAttribute("user_mind", mind);
			viewPage = "ad_user_point.jsp";
		}
		else if(com.equals("/ad_user_sanswer.do")) {
			int mind = (int)session.getAttribute("user_mind");
			int sind = Integer.parseInt(request.getParameter("sind"));
			ArrayList<SparticipationDto> spdto = new ArrayList<SparticipationDto>();
			ArrayList<SquestionDto> sqdto = new ArrayList<SquestionDto>();
			
			adservice.ad_user_sanswer(mind,sind,spdto,sqdto);
			
			System.out.println(spdto.size());
			System.out.println(sqdto.size());
			
			session.setAttribute("user_question", sqdto);
			session.setAttribute("user_participation", spdto);
			viewPage = "ad_user_sanswer.jsp";
		}
		else if(com.equals("/ad_ad.do")) {
			ArrayList<MemberDto> dto = new ArrayList<MemberDto>();
			
			adservice.ad_ad(dto);
			
			session.setAttribute("admininfo",dto);
			viewPage = "ad_ad.jsp";
		} 
		else if(com.equals("/ad_inquiry.do")) {
			ArrayList<InquiryDto> dto = new ArrayList<InquiryDto>();
			ArrayList<String> name = new ArrayList<String>();
			
			adservice.ad_inquiry(dto,name);
			
			session.setAttribute("ad_inquiry", dto);
			session.setAttribute("ad_inquiry_name", name);
			viewPage = "ad_inquiry.jsp";
		}
		else if(com.equals("/ad_reanswer.do")) {
			int iqind = (int)session.getAttribute("ansiqind");
			System.out.println(iqind);
			long miliseconds = System.currentTimeMillis();
			Date redate = new Date(miliseconds);
			String conanswer = request.getParameter("ansinquiry");
			int admind = (int)session.getAttribute("ad_mind");
			
			adservice.ad_reanswer(iqind,admind,conanswer,redate);
			viewPage = "ad_inquiry.do";
		}
		else if(com.equals("/ad_survey.do")) {
			ArrayList<SurveyDto> dto = new ArrayList<SurveyDto>();
			
			adservice.ad_survey(dto);
			session.setAttribute("ad_survey",dto);
			viewPage = "ad_survey.jsp";
		}
		else if(com.equals("/survey_register.do")) {
			ArrayList<SquestionDto> sqdto = new ArrayList<SquestionDto>();
			
			String directory = "C:\\apache-tomcat-9.0.70-windows-x64\\apache-tomcat-9.0.70\\wtpwebapps\\HSP\\image";
			int maxSize = 1024*1024*100;
			String encoding = "UTF-8";
			
			long miliseconds = System.currentTimeMillis();
			
			MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,
					new DefaultFileRenamePolicy());
			
			String title = multipartRequest.getParameter("qmt");
			String subtitle = multipartRequest.getParameter("qst");
			String simg = multipartRequest.getFilesystemName("simg");
			Date redate = new Date(miliseconds);
			Date sdl = java.sql.Date.valueOf(multipartRequest.getParameter("date"));
			int point = Integer.parseInt(multipartRequest.getParameter("point"));
			
			SurveyDto sdto = new SurveyDto(0,title,subtitle,simg,redate,sdl,point);
			int sind = adservice.resurvey(sdto);
			System.out.println(sind);
			
			int quescount = Integer.parseInt(multipartRequest.getParameterValues("qc")[0]);
			
			for(int i = 1; i <= quescount; i++) {
				int numques = i;
				String question = multipartRequest.getParameter("q"+i);
				
				int numselect = 1;
				String conselect = multipartRequest.getParameter("q"+i+"_op1");
				System.out.println(conselect);
				SquestionDto dto = new SquestionDto(0,i,question,numselect,conselect);
				sqdto.add(dto);
				
				numselect = 2;
				conselect = multipartRequest.getParameter("q"+i+"_op2");
				dto = new SquestionDto(0,i,question,numselect,conselect);
				sqdto.add(dto);
				
				numselect = 3;
				conselect = multipartRequest.getParameter("q"+i+"_op3");
				if(!conselect.equals("")) {
					dto = new SquestionDto(0,i,question,numselect,conselect);
					sqdto.add(dto);
				}
				else {
					continue;
				}
				
				numselect = 4;
				conselect = multipartRequest.getParameter("q"+i+"_op4");
				if(!conselect.equals("")) {
					dto = new SquestionDto(0,i,question,numselect,conselect);
					sqdto.add(dto);
				}
			}
			
			adservice.resquestion(sind, sqdto);
			viewPage = "ad_survey.do";
		}
		else if(com.equals("/sdelete.do")) {
			int sind = Integer.parseInt(request.getParameterValues("sdelete")[0]);
			
			adservice.sdelete(sind);
			viewPage="ad_survey.do";
		}
		else if(com.equals("/ad_qp.do")) {
			ArrayList<QpDto> dto = new ArrayList<QpDto>();
			ArrayList<String> id = new ArrayList<String>();
			
			adservice.ad_qp(dto,id);
			session.setAttribute("ad_qp",dto);
			session.setAttribute("ad_qp_mid", id);
			viewPage = "ad_qp.jsp";
		}
		else if(com.equals("/ad_qpdelete.do")) {
			int qind = Integer.parseInt(request.getParameterValues("qpdelete")[0]);
			
			adservice.qpdelete(qind);
			viewPage="ad_qp.do";
		}
		else if(com.equals("/ad_an_survey.do")) {
			ArrayList<AnsurveyDto> dto = new ArrayList<AnsurveyDto>();
			
			adservice.ad_an_survey(dto);
			session.setAttribute("ad_an_survey",dto);
			viewPage="ad_an_survey.jsp";
		}
		else if(com.equals("/ad_an_survey_num.do")) {
			int sind = Integer.parseInt(request.getParameter("ansind"));
			String title = request.getParameter("antitle");
			
			ArrayList<Ansurveynum> asn = new ArrayList<Ansurveynum>();
			
			adservice.ad_an_survey_num(sind,asn);
			session.setAttribute("asnsind", sind);
			session.setAttribute("asntitle", title);
			session.setAttribute("asn", asn);
			viewPage = "ad_an_survey_num.jsp";
		}
		else if(com.equals("/ad_an_survey_det.do")) {
			int sind = Integer.parseInt(request.getParameter("ansind"));
			ArrayList<AnsurveydetDto> asddto = new ArrayList<AnsurveydetDto>();
			ArrayList<String> question = new ArrayList<String>();
			
			adservice.ad_an_survey_det(sind,asddto,question);
			session.setAttribute("asdsind", sind);
			session.setAttribute("ad_an_survey_det",asddto);
			session.setAttribute("asdquestion", question);
			viewPage = "ad_an_survey_det.jsp";	
		}
		else if(com.equals("/ad_an_qp.do")) {
			ArrayList<AnqpDto> dto = new ArrayList<AnqpDto>();
			
			adservice.ad_an_qp(dto);
			session.setAttribute("ad_an_qp",dto);
			viewPage="ad_an_qp.jsp";
		}
		else if(com.equals("/ad_an_qp_num.do")) {
			int qind = Integer.parseInt(request.getParameter("qind"));
			String question = request.getParameter("question");
			
			ArrayList<AnqpnumDto> aqn = new ArrayList<AnqpnumDto>();
			
			adservice.ad_an_qp_num(qind,aqn);
			session.setAttribute("aqnqind", qind);
			session.setAttribute("aqnquestion", question);
			session.setAttribute("aqn", aqn);
			viewPage = "ad_an_qp_num.jsp";
		}
		else if(com.equals("/ad_an_qp_det.do")) {
			int qind = Integer.parseInt(request.getParameter("qind"));
			String question = request.getParameter("question");
			
			ArrayList<AnqpdetDto> aqd = new ArrayList<AnqpdetDto>();
			
			adservice.ad_an_qp_det(qind,aqd);
			System.out.println("qind:"+qind);
			System.out.println("question:"+question);
			System.out.println("aqd.size():"+aqd.size());
			session.setAttribute("aqdqind", qind);
			session.setAttribute("aqdquestion", question);
			session.setAttribute("ad_an_qp_det", aqd);
			viewPage = "ad_an_qp_det.jsp";
		}
		response.sendRedirect(viewPage);
	}
}
