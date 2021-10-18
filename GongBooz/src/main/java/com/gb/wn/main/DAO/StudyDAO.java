package com.gb.wn.main.DAO;

import java.util.ArrayList;

import com.gb.wn.main.study.studyVO.StudyVO;

//mapper interface 참조. dao에 선언한 것은 controller를 도와주기 위해.
public interface StudyDAO {
	ArrayList <StudyVO> getAllStudy();
	void insertStudy(StudyVO studyVO); //스터디 입력
	ArrayList <StudyVO> getStudy_region(StudyVO studyVO); //지역으로 스터디 찾기
	ArrayList <StudyVO> getStudy_tag(StudyVO studyVO); //태그로 스터디 찾기
	ArrayList <StudyVO> getStudy_name(StudyVO studyVO); //이름으로 스터디 찾기
		
	void deleteStudy(StudyVO studyVO); //스터디를 삭제한다.
	void updateStudy(StudyVO stuyVO); //참가인원이 변동될수록 수행된다.참여하시겠습니까? 탈퇴하시겠습니까?
	
	StudyVO getStudyRoom(StudyVO studyVO);
}
//+ mybatis는 sqlsession 등 객체가 무조건 중요
