package egovframework.member.service.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.member.service.MailSendService;
import egovframework.member.service.MailSendService2;
import egovframework.member.service.MemberService;
import egovframework.member.service.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private MailSendService2 mailService2;

	// 이메일 인증
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	// 이메일 인증
//	@RequestMapping(value = "/pwEmail.do", method = RequestMethod.GET)
//	@ResponseBody
//	public String pwEmail(String email) {
//		System.out.println("이메일 인증 요청이 들어옴!");
//		System.out.println("이메일 인증 이메일 : " + email);
//		return mailService2.joinEmail(email);
//	}

	// 로그인 시도
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginAction(MemberVO vo, Model model) throws Exception {
		MemberVO loginUser = memberService.loginUser(vo);

		if (loginUser == null) {
			model.addAttribute("check", 1);
			model.addAttribute("message", "아이디와 비밀번호를 확인해주세요.");
			return "member/login";
		} else {
			model.addAttribute("loginUser", loginUser);
			return "redirect:index";
		}
	}

	@RequestMapping(value = "/insertMember.do", method = RequestMethod.GET)
	public String insertMemberView(MemberVO vo) throws Exception {
		System.out.println("회원가입 화면 이동");
		return "insertMember";
	}

	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		System.out.println("회원 등록중");
		String message = "";

		String inputPass = vo.getPwd();
		String pass = passEncoder.encode(inputPass);
		vo.setPwd(pass);

		String result = memberService.insertMember(vo);
		if (result == null) {
			message = "ok";
		}
		return message;
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "find_id_form.do")
	public String findIdView() {
		return "findId";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, Model model) throws Exception {
		MemberVO user = memberService.findId(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUid());
		}

		return "findId";
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "find_password_form.do")
	public String findPasswordView() {
		return "findPassword";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "find_password.do", method = RequestMethod.POST)
	public String findPasswordAction(MemberVO vo, Model model) throws Exception {
		MemberVO user = memberService.findPassword(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getUid());
		}

		return "findPassword";
	}

	// 비밀번호 바꾸기 실행
	@RequestMapping(value = "update_password.do", method = RequestMethod.POST)
	public String updatePasswordAction(@RequestParam(value = "updateid", defaultValue = "", required = false) String id,
			MemberVO vo) throws Exception {
		String inputPass = vo.getPwd();
		String pass = passEncoder.encode(inputPass);
		vo.setPwd(pass);
		vo.setUid(id);
		System.out.println(vo);
		memberService.updatePassword(vo);
		return "findPasswordConfirm";
	}

	// 비밀번호 바꾸기할 경우 성공 페이지 이동
	@RequestMapping(value = "check_password_view")
	public String checkPasswordForModify(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "loginWrite";
		} else {
			return "checkformodify";
		}
	}

	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String uid) throws Exception {

		String message = "";
		int count = memberService.selectMemberIdCheck(uid);// 중복된 데이터
		if (count == 0) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping("/emailcheck.do")
	@ResponseBody
	public String selectMemberEmailCheck(String email) throws Exception {

		String message = "";
		int count = memberService.selectMemberEmailCheck(email);// 중복된 데이터
		if (count == 0) {
			message = "ok";
		}
		return message;
	}

	@RequestMapping("updateMember.do")
	public String updateMember(MemberVO vo) throws Exception {
		System.out.println("회원 수정완료");
		
		String inputPass = vo.getPwd();
		String pass = passEncoder.encode(inputPass);
		vo.setPwd(pass);
		
		memberService.updateMember(vo);
		return "forward:main.do";
	}

	@RequestMapping(value="deleteMember.do",method=RequestMethod.GET)
	public String deleteMemberView(MemberVO vo) throws Exception {
		System.out.println("회원삭제 페이지");
		return "deleteView";
	}
	
	@RequestMapping(value="deleteMember.do",method=RequestMethod.POST)
	public String deleteMember(MemberVO vo,HttpSession session) throws Exception {
		System.out.println("회원삭제 완료");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("level");
		memberService.deleteMember(vo);
		return "forward:main.do";
	}
	

	@RequestMapping("selectMember.do")
	public String selectMember(MemberVO vo, Model model) throws Exception {
		System.out.println("회원수정");
		model.addAttribute("member1", memberService.selectMember(vo));
		System.out.println(model);
		return "updateMember";
	}

	@RequestMapping("ListMember.do")
	public String ListMember(MemberVO vo, Model model) throws Exception {
		System.out.println("회원들 보자");
		model.addAttribute("memberList", memberService.selectMemberList(vo));
		return "ListMember";
	}

	@RequestMapping("loginWrite.do")
	public String loginWrite() {
		return "loginWrite";
	}

	@RequestMapping("loginWriteSub.do")
	@ResponseBody
	public String loginProcessing(MemberVO vo, HttpSession session) throws Exception {
		MemberVO login = memberService.loginUser(vo);
		boolean passMatch = passEncoder.matches(vo.getPwd(), login.getPwd());
		String message = "";
		String returnUrl = "";
		
		// 기존에 로그인 세션 정보가 있으면 삭제
		if (session.getAttribute("id") != null) {
			session.removeAttribute("id");
		}

		session.setAttribute("id", login.getUid());
		session.setAttribute("name", login.getName());
		session.setAttribute("level", login.getLevel());
		System.out.println("1, " + session.getAttribute("id"));
		String priorUrl = (String) session.getAttribute("url_prior_login");
		System.out.println("2, " + priorUrl);

		if (priorUrl != null) {
			returnUrl = "redirect:" + priorUrl;
			System.out.println("3, " + returnUrl);
		} else {
			returnUrl = "redirect:/ComplList.do";
			System.out.println("4, " + returnUrl);
		}

		// 암호화된 비밀번호 로그인.
		if (login != null && passMatch&&!login.isWithdraw()) {
			session.setAttribute("id", login.getUid());
			session.setAttribute("name", login.getName());
			session.setAttribute("level", login.getLevel());
			message = "ok";
		} else {
			session.setAttribute("id", null);
		}
		return message;
	}


	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("level");
		return "forward:main.do";
	}

	@RequestMapping("homePage.do")
	public String homePage() {
		return "homePage";
	}

	@RequestMapping("index.do")
	public String index() {
		return "index";
	}

	@RequestMapping("index2.do")
	public String index2() {
		return "index2";
	}

	@RequestMapping("index3.do")
	public String index3() {
		return "index3";
	}

	@RequestMapping("test.do")
	public String test() {
		return "test";
	}
	
	@RequestMapping("updateLevel.do")
	public String updateLevel(String id) throws Exception{

		memberService.updateLevel(id);
		return "forward:ListMember.do";
	}
	
	@RequestMapping(value="deleteMember2.do")
	public String forceDeleteMember(String id) throws Exception {
		System.out.println("회원삭제 완료");
		memberService.forceDelete(id);
		return "forward:ListMember.do";
	}
}
