package com.gb.wn;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gb.wn.main.Service.StudyService;
import com.gb.wn.main.study.studyVO.StudyVO;

@Controller
public class StudyController {
	
	@Resource(name="StudyService")
	private StudyService studyService;

	//전체 스터디 목록 조회
	@RequestMapping(value="/studyAll.do")
	public String studyAll(Model model) throws Exception{
		ArrayList <StudyVO> alist = studyService.getAllStudy();
		model.addAttribute("alist",alist);
		return "studyAll"; //studyAll.jsp에서 전부 출력
	}
	
	@RequestMapping(value="/studyInsertForm.do")
	public String studyInsertForm(@ModelAttribute("studyVO") StudyVO studyVO, Model model) throws Exception{
		return "studyInsertForm";
	}
	
	@RequestMapping(value="/studyInsert.do")
	public String studyInsert(@ModelAttribute("studyVO") StudyVO studyVO, Model model) throws Exception {
		studyService.insertStudy(studyVO);		
		studyService.getAllStudy();
	
		return "redirect:/studyAll.do";
	}
	
	@RequestMapping(value="/search-controller.do", method= RequestMethod.POST)
	public String studySearch(@ModelAttribute("studyVO") StudyVO studyVO,Model model, HttpServletRequest req) throws Exception {
		String filter = req.getParameter("filter");
		String search = req.getParameter("search");	
		
		String whatSearched = filter+"|"+search;
		model.addAttribute("whatSearched", whatSearched);
		
		if(filter.equals("study_name")) {
			studyVO.setStudy_name(search);
			ArrayList <StudyVO> svo_name = studyService.getStudy_name(studyVO);
			model.addAttribute("alist",svo_name);
			req.setAttribute("alist", svo_name);
						
			return "studyAll";
		}
		else if(filter.equals("study_tag")) {
			studyVO.setStudy_tag(search);
			ArrayList <StudyVO> svo_tag = studyService.getStudy_tag(studyVO);
			model.addAttribute("alist",svo_tag);
			req.setAttribute("alist", svo_tag);
			return "studyAll";
		}
		else if(filter.equals("region")) {
			studyVO.setRegion(search);
			ArrayList <StudyVO> svo_region = studyService.getStudy_region(studyVO);
			model.addAttribute("alist",svo_region);
			req.setAttribute("alist", svo_region);
			return "studyAll";
		}
		studyService.getAllStudy();	
		return "redirect:/studyAll";
		
	}
	//스터디룸에 접속한다.
	@RequestMapping(value="/studyRoom.do", method= RequestMethod.POST)
	public String studyRoom(@ModelAttribute("studyVO") StudyVO studyVO, Model model,HttpServletRequest req) throws Exception{
		
		String study_name = req.getParameter("study_name");
		System.out.println(study_name);
		
		StudyVO bb = new StudyVO();
		bb.setStudy_name(study_name);
		
		studyService.updateStudy(bb);
		StudyVO aa=studyService.getStudyRoom(studyVO);
		
		System.out.println(aa.getCur_number());
		System.out.println(aa.getRegion());
		
		HttpSession session = req.getSession();
		session.setAttribute("studyVO", aa);
		
		session.setAttribute("num", aa.getMax_number()- aa.getCur_number());
		//session.setAttribute("region", aa.getRegion());
		
		
		/*HttpSession session = req.getSession();
		session.getAttribute("study_name");
		System.out.println(session.getAttribute("study_name"));
		
		StudyVO aa=studyService.getStudyRoom(studyVO);*/
		//StudyVO bb=studyService.updateStudy(studyVO);
		
		//studyService.updateStudy(studyVO); //참가한 인원수를 증가시키고
		//studyService.getStudyRoom(studyVO); //스터디룸에 접근한다.
		
		
		
		return "studyRoom";
	}
	//진짜로 참여할 것인지 묻는다.
	@RequestMapping(value="/studyAlert.do",method= RequestMethod.POST)
	public String studyAlert(@ModelAttribute("studyVO") StudyVO studyVO, Model model,HttpServletRequest req) throws Exception{
		//studyService.updateStudy(studyVO);
		HttpSession session = req.getSession();
		
		String study_name = req.getParameter("study_name");
		
		StudyVO aa=studyService.getStudyRoom(studyVO);
		
		System.out.println("request"+study_name);
		System.out.println("vo"+studyVO.getStudy_name());
		
		session.setAttribute("studyVO",aa);
		System.out.println("session 출력 "+session.getAttribute("study_name"));
		model.addAttribute("study_name",study_name);
		return "studyAlert";
	}

	
}
