package com.gb.wn.main.study.studyVO;

public class StudyVO {
	private String study_name; //���͵� ���� �̸�
	private String study_tag; //���͵� ���� �±�
	private String region; //�������� ���
	private int max_number; //�ο� ���Ѽ� 
	private int cur_number; //���� �����ο�
	
	public StudyVO() {};
	
	
	public StudyVO(String study_name, String study_tag, String region, int max_number, int cur_number) {
		super();
		this.study_name = study_name;
		this.study_tag = study_tag;
		this.region = region;
		this.max_number = max_number;
		this.cur_number = max_number; //�������� �����ο��� ���� �ܿ� �ο��� �����ִ� ���. 
	}

	//�߰��� ������ �������

	//getter, setter
	public String getStudy_name() {
		return study_name;
	}
	public void setStudy_name(String study_name) {
		this.study_name = study_name;
	}
	public String getStudy_tag() {
		return study_tag;
	}
	public void setStudy_tag(String study_tag) {
		this.study_tag = study_tag;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getMax_number() {
		return max_number;
	}
	public void setMax_number(int max_number) {
		this.max_number = max_number;
	}
	
	//���� ���� �ο� 
	public int getCur_number() {
		return cur_number;
	}

	public void setCur_number(int cur_number) {
		this.cur_number = cur_number;
	}
	
	
	
}
