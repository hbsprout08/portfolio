package com.gb.wn.main.study.studyVO;

public class StudyVO {
	private String study_name; //스터디 모임 이름
	private String study_tag; //스터디 종류 태그
	private String region; //오프라인 장소
	private int max_number; //인원 제한수 
	private int cur_number; //현재 참여인원
	
	public StudyVO() {};
	
	
	public StudyVO(String study_name, String study_tag, String region, int max_number, int cur_number) {
		super();
		this.study_name = study_name;
		this.study_tag = study_tag;
		this.region = region;
		this.max_number = max_number;
		this.cur_number = max_number; //정원에서 참여인원을 빼서 잔여 인원을 보여주는 방식. 
	}

	//추가로 생성자 만들수도

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
	
	//현재 정원 인원 
	public int getCur_number() {
		return cur_number;
	}

	public void setCur_number(int cur_number) {
		this.cur_number = cur_number;
	}
	
	
	
}
