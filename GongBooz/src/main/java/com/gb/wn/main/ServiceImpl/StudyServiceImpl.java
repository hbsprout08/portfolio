package com.gb.wn.main.ServiceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gb.wn.main.DAO.StudyDAO;
import com.gb.wn.main.Service.StudyService;
import com.gb.wn.main.study.studyVO.StudyVO;

//business logic 상세 작업 . @Controller나 dao의 내용을 service가 맡아서 한다. impl 확장성,유연성
@Service("StudyService")
public class StudyServiceImpl implements StudyService{
	
	@Autowired //StudyDAO를 스프링에 등록.객체 인자전달한 효과.
	private StudyDAO studyroom;

	//등록된 모든 스터디 목록 조회
	@Override
	@Transactional
	public ArrayList<StudyVO> getAllStudy() throws Exception {
		//dao의 메소드를 찾아간다.
		return studyroom.getAllStudy();
	}

	@Override
	public void insertStudy(StudyVO studyVO) {
		studyroom.insertStudy(studyVO);		
	}

	@Override
	public ArrayList <StudyVO> getStudy_region(StudyVO studyVO) {
		return studyroom.getStudy_region(studyVO);
	}

	@Override
	public ArrayList <StudyVO> getStudy_tag(StudyVO studyVO) {
		return studyroom.getStudy_tag(studyVO);
	}

	@Override
	public ArrayList <StudyVO> getStudy_name(StudyVO studyVO) {
		return studyroom.getStudy_name(studyVO);
	}

	@Override
	public void deleteStudy(StudyVO studyVO) {
		studyroom.deleteStudy(studyVO);		
	}
	//select *가 mapper에 있다.
	//전부 가져와서 종이상자 = resultSet에 넣고 이것을 객체 단위로 해서 넘겨줄 것이다.

	//+
	@Override
	public void updateStudy(StudyVO studyVO) {
		studyroom.updateStudy(studyVO);
		
	}

	@Override
	public StudyVO getStudyRoom(StudyVO studyVO) {	
		System.out.println("service impl"+studyVO.getStudy_name());
		return studyroom.getStudyRoom(studyVO);
	}
	
}
