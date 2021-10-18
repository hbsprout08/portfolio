package com.gb.wn.main.ServiceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gb.wn.main.DAO.StudyDAO;
import com.gb.wn.main.Service.StudyService;
import com.gb.wn.main.study.studyVO.StudyVO;

//business logic �� �۾� . @Controller�� dao�� ������ service�� �þƼ� �Ѵ�. impl Ȯ�强,������
@Service("StudyService")
public class StudyServiceImpl implements StudyService{
	
	@Autowired //StudyDAO�� �������� ���.��ü ���������� ȿ��.
	private StudyDAO studyroom;

	//��ϵ� ��� ���͵� ��� ��ȸ
	@Override
	@Transactional
	public ArrayList<StudyVO> getAllStudy() throws Exception {
		//dao�� �޼ҵ带 ã�ư���.
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
	//select *�� mapper�� �ִ�.
	//���� �����ͼ� ���̻��� = resultSet�� �ְ� �̰��� ��ü ������ �ؼ� �Ѱ��� ���̴�.

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
