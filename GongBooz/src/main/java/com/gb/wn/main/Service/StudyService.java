package com.gb.wn.main.Service;

import java.util.ArrayList;

import com.gb.wn.main.study.studyVO.StudyVO;

//service�� ������ ���� mapper�� �����ֱ� ����
public interface StudyService {	
	ArrayList <StudyVO> getAllStudy() throws Exception;
	void insertStudy(StudyVO studyVO);
	ArrayList <StudyVO> getStudy_region(StudyVO studyVO); //�������� ���͵� ã��
	ArrayList <StudyVO> getStudy_tag(StudyVO studyVO); //�±׷� ���͵� ã��
	ArrayList <StudyVO> getStudy_name(StudyVO studyVO); //�̸����� ���͵� ã��
		
	void deleteStudy(StudyVO studyVO);
	void updateStudy(StudyVO stuyVO); //�ܿ� �ο� ������Ʈ.
	
	StudyVO getStudyRoom(StudyVO studyVO);
	
	//service�� dao�� ������ ����.
   
}
