package com.gb.wn.main.DAO;

import java.util.ArrayList;

import com.gb.wn.main.study.studyVO.StudyVO;

//mapper interface ����. dao�� ������ ���� controller�� �����ֱ� ����.
public interface StudyDAO {
	ArrayList <StudyVO> getAllStudy();
	void insertStudy(StudyVO studyVO); //���͵� �Է�
	ArrayList <StudyVO> getStudy_region(StudyVO studyVO); //�������� ���͵� ã��
	ArrayList <StudyVO> getStudy_tag(StudyVO studyVO); //�±׷� ���͵� ã��
	ArrayList <StudyVO> getStudy_name(StudyVO studyVO); //�̸����� ���͵� ã��
		
	void deleteStudy(StudyVO studyVO); //���͵� �����Ѵ�.
	void updateStudy(StudyVO stuyVO); //�����ο��� �����ɼ��� ����ȴ�.�����Ͻðڽ��ϱ�? Ż���Ͻðڽ��ϱ�?
	
	StudyVO getStudyRoom(StudyVO studyVO);
}
//+ mybatis�� sqlsession �� ��ü�� ������ �߿�
