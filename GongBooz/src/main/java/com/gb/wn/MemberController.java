package com.gb.wn;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;


import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gb.wn.main.Service.MemberService;
import com.gb.wn.main.member.memberVO.MemberVO;




@Controller
public class MemberController {

	
	@Resource(name="memberService")
	private MemberService memkaja;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	//�α��� ȭ������ 
	@RequestMapping(value="member/login.do")
	public String loingView(){
		
		return "member/login";
	}
	
	@RequestMapping(value="member/myinfo.do")
	public String infoView(){
		
		return "member/myinfo";
	}
	
	//ȸ������ ȭ������ 
	@RequestMapping(value="member/join.do")
	public String joinView(){
		
		return "member/register";
	}
	
	// ȸ������ get
	@RequestMapping(value = "member/register.do", method = RequestMethod.GET)
	public void getRegister() throws Exception {
	}
		
	// ȸ������ post
	@RequestMapping(value = "member/register.do", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		System.out.println("ȸ������");
		
		int result = memkaja.idChk(vo);
		System.out.println(result);
		try {
			if(result == 1) {
				return "member/register";
				/*return "member/login";*/
			}else if(result == 0) {
			/*	String inputPass = vo.getUserpass();
				//ȸ������ ��û�� �������� ��й�ȣ�� ��ȣȣȭ �Ͽ� �ٽ� vo���־� �ش� .�׸��� �ٽ� ȸ������ ���񽺸� �����Ѵ�. 
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserpass(pwd);*/
				
				
				memkaja.register(vo);
			}
			// ��⿡��~ �Էµ� ���̵� �����Ѵٸ� -> �ٽ� ȸ������ �������� ���ư��� 
			// �������� �ʴ´ٸ� -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
	
		return "member/login";
	}
	//�α���
	@RequestMapping(value = "member/loginOk.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		String loginok = "";
		HttpSession session = req.getSession();
		MemberVO login = memkaja.login(vo);
		
		if(login == null) {
			
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			
			loginok = "redirect:/member/login.do";
		}else {
			session.setAttribute("member", login);
			loginok = "member/myinfo";
		
		}
		
		return loginok;
	}	
	
	
	@RequestMapping(value = "member/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		System.out.println("�α׾ƿ��Ϸ��Դ�.");
		session.invalidate();
		
		/*return "redirect:/";*/
		return "member/login";
	}
	
	@RequestMapping(value="member/memberUpdateView.do", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		
		return "member/memberUpdateView";
	}

	//ȸ������ ���� 
	@RequestMapping(value="member/memberUpdate.do", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		System.out.println("ȸ����������");
		memkaja.memberUpdate(vo);
		
		session.invalidate();
		
		return "member/login";
	}
	
	// ȸ�� Ż�� get
	@RequestMapping(value="member/memberDeleteView.do", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// ȸ�� Ż�� post
	@RequestMapping(value="member/memberDelete.do", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// ���ǿ� �ִ� member�� ������ member������ �־��ݴϴ�.
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		// ���ǿ��ִ� ��й�ȣ
		System.out.println(member.getUserpass());
		String sessionPass = member.getUserpass();
		// vo�� ������ ��й�ȣ
		String voPass = vo.getUserpass();
		System.out.println("�Է��� ��й�ȣ :"+voPass);
		System.out.println("���̵�:"+member.getUserid());
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			/*return "member/memberDeleteView";*/
			return "redirect:/member/memberDeleteView.do";
		}
		memkaja.memberDelete(vo);
		session.invalidate();
		System.out.println("ȸ��Ż��");
		return "member/login";
	}
	

	// �н����� üũ
	@ResponseBody//????????
	@RequestMapping(value="member/passChk.do", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = memkaja.passChk(vo);
		System.out.println("�н�����üũ/"+result);
		return result;
	}
	
	@RequestMapping(value="member/kajainfo.do")
	public String kajainfo(){
		return "member/myinfo";
	}
	
	

	// ���̵� �ߺ� üũ
	@ResponseBody
	@RequestMapping(value="member/idChk.do", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		System.out.println("���̵��ߺ�üũ");
		int result = memkaja.idChk(vo);
		return result;
	}
	
	/* �̸��� ���� */
	@RequestMapping(value="member/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		System.out.println("�̸��� ���� ");
		/* ��(View)�κ��� �Ѿ�� ������ Ȯ�� */
	/*	logger.info("�̸��� ������ ���� Ȯ��");
		logger.info("�̸��� : " + email);*/
		System.out.println(email);
				
		/* ������ȣ(����) ���� */
		Random random = new Random();
		//int checkNum = random.nextInt(888888) + 111111;
		int checkNum = 127219;
		/*logger.info("������ȣ " + checkNum);*/
		System.out.println("������ȣ " + checkNum);
		/* �̸��� ������ */
		String setFrom = "lisa9963suhyun@gmail.com"; ///////////////////////////////////�ڽ��� �̸��� �Է�
		String toMail = email;
		String title = "ȸ������ ���� �̸��� �Դϴ�.";
		String content = 
				"GoonBooZ�� �湮���ּż� �����մϴ�." +
				"<br><br>" + 
				"���� ��ȣ�� " + checkNum + "�Դϴ�." + 
				"<br>" + 
				"�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	

	@RequestMapping(value="member/findPw.do")
	public String findPwView(){
		
		return "member/findform";
	}
	
	// ��й�ȣ ã��
	@RequestMapping(value = "member/find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception{
		System.out.println("��й�ȣã��");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String subject = "";
		String msg = "";
		// ���̵� ������
		if(memkaja.idChk(member) == 0) {
			out.print("���̵� �����ϴ�.");
			out.close();
		}
		// ���Կ� ����� �̸����� �ƴϸ�
		else if(!member.getMembermail().equals(memkaja.emailfind(member).getMembermail())) {
			out.print("�߸��� �̸��� �Դϴ�.");
			out.close();
		}else {	
			// �ӽ� ��й�ȣ ����
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setUserpass(pw);
			// ��й�ȣ ����
			memkaja.update_pw(member);
			
			subject = "GongBooZ �ӽ� ��й�ȣ �Դϴ�.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getUserid() + "���� �ӽ� ��й�ȣ �Դϴ�. ��й�ȣ�� �����Ͽ� ����ϼ���.</h3>";
			msg += "<p>�ӽ� ��й�ȣ : ";
			msg += member.getUserpass() + "</p></div>";
			// �޴� ��� E-Mail �ּ�
			String mail = member.getMembermail();
			String setFrom = "lisa9963suhyun@gmail.com"; ////////////////////////�ڽ��� �̸��� �Է�
			// ��й�ȣ ���� ���� �߼�
			//send_mail(member, "find_pw");
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(mail);
				helper.setSubject(subject);
				helper.setText(msg,true);
				mailSender.send(message);
				
			}catch(Exception e) {
				e.printStackTrace();
			}		
			
	
			
			out.print("�̸��Ϸ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
			out.close();
		}
	
	}
	
	
	// ���̵� ã��
	@RequestMapping(value = "member/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("membermail") String email, Model md) throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if (memkaja.find_id(email).isEmpty()) {
			out.println("<script>");
			out.println("alert('���Ե� ���̵� �����ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
		}
		
		md.addAttribute("array", memkaja.find_id(email));
		
		
		
		return "member/find_id";
		
	}
	
	// �̸��� �ߺ� �˻�(AJAX)
	@RequestMapping(value = "member/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("membermail") String email, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(memkaja.check_email(email));
		out.close();
	}


	
}