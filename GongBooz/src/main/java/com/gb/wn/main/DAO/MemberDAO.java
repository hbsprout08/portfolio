package com.gb.wn.main.DAO;

import java.util.List;

import com.gb.wn.main.member.memberVO.MemberVO;

public interface MemberDAO {

	// ȸ������
		public void register(MemberVO vo) throws Exception;
		
		//�α���// xml���� ��ȸ�� �����͵��� MemberVO�� ��´�.
		public MemberVO login(MemberVO vo) throws Exception;
		
		//ȸ������ ���� 
		public void memberUpdate(MemberVO vo) throws Exception;
		
		// ȸ�� Ż��
		public void memberDelete(MemberVO vo)throws Exception;
		
		// �н����� üũ
		public int passChk(MemberVO vo) throws Exception;
		
		// ���̵� �ߺ�üũ
		public int idChk(MemberVO vo) throws Exception;
		
		
		// ��й�ȣ ����
			
		public int update_pw(MemberVO vo) throws Exception;
		
		//�̸���Ȯ��
		public MemberVO emailfind(MemberVO vo) throws Exception;
		
		// ���̵� ã��
		//public String find_id(String email) throws Exception;
		public List<MemberVO> find_id(String email) throws Exception;
		
		// �̸��� �ߺ� �˻�
		public int check_email(String email) throws Exception;
	
		
}
