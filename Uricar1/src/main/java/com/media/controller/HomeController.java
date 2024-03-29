package com.media.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dto.MemberDto;
import com.media.service.MemberService;

//회원 관리(로그인, 가입, 로그아웃에 사용하는 컨트롤러)
@Controller
public class HomeController {
	
	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//@GetMapping
	// = @RequestMapping 의 get 방식만 처리하는 어노테이션
	
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	}
	
	//로그인 화면 전환 메소드
	@GetMapping("login")
	public String login() {
		logger.info("login()");
		
		return "login";
	}
	
	@GetMapping("cloginFrm")
	public String cloginFrm() {
		logger.info("cloginFrm()");
		
		return "cloginFrm";
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm()");
		
		return "loginFrm";
	}
	@GetMapping("privacyPolicy123123")
	public String privacyPolicy123123() {
		logger.info("privacyPolicy123123()");
		
		return "privacyPolicy123123";
	}
	
	@GetMapping("terms123123")
	public String terms123123() {
		logger.info("terms123123()");
		
		
		return "terms123123";
	}

	@GetMapping("mypageFrm")
	public String mypageFrm() {
		logger.info("mypageFrm()");
		
		return "mypageFrm";
	}
	
	@GetMapping("terms")
	public String terms() {
		logger.info("terms()");
		
		return "terms";
	}
	
	@GetMapping("privacyPolicy")
	public String privacyPolicy() {
		logger.info("privacyPolicy()");
		
		return "privacyPolicy";
	}
	
	@GetMapping("cmInfo")
	public String cmInfo() {
		logger.info("cmInfo()");
		
		return "cmInfo";
	}
	
	@GetMapping("cmInfo2")
	public String cmInfo2() {
		logger.info("cmInfo()");
		
		return "cmInfo2";
	}
	
	@GetMapping("mmJoin")
	public String mmJoin() {
		logger.info("mmJoin()");
		
		return "mmJoin";
	}
	
	@GetMapping("cmJoin")
	public String cmJoin() {
		logger.info("cmJoin()");
		
		return "cmJoin";
	}
	
	@GetMapping("id_find")
	public String id_find() {
		logger.info("id_find()");
		
		return "id_find";
	}
	
	@GetMapping("reserv")
	public String reserv() {
		logger.info("reserv()");
		
		return "reserv";
	}
	
	@PostMapping("access")
	public ModelAndView accessProc(MemberDto member, 
			RedirectAttributes rttr) {
		logger.info("accessProc()");
		
		mv = mServ.loginProc(member, rttr);
		
		return mv;
	}
	
	@GetMapping("joinFrm")
	public String joinFrm() {
		return "joinFrm";
	}
	
	@GetMapping("cuCenter")
	public String cuCenter() {
		logger.info("cuCenter()");
		
		return "cuCenter";
	}
	
	@GetMapping("id_searchCtl")
	public String id_searchCtl() {
		logger.info("id_searchCtl");
		
		return "id_searchCtl";
	}
	
	@GetMapping("id_searchCtl2")
	public String id_searchCtl2() {
		logger.info("id_searchCtl2");
		
		return "id_searchCtl2";
	}
	
	@GetMapping("FAQ")
	public String FAQ() {
		logger.info("FAQ()");
		
		return "FAQ";
	}
	
	@PostMapping("memInsert")
	public ModelAndView memInsert(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("memInsert()");
		
		//서비스에서 처리
		mv = mServ.memberInsert(member, rttr);
		
		return mv;
	}
	
	//로그아웃 처리
	@GetMapping("logout")
	public String logout() {
		//세션에 저장된 로그인 정보(회원 정보) 삭제
		//첫번째 페이지로 이동.
		String view = mServ.logout();
		return view;
	}
	
	//id 중복 체크 처리 메소드
	@GetMapping(value = "idCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String mid) {
		logger.info("idCheck() - mid : " + mid);
		
		String result = mServ.idCheck(mid);
		
		return result;
	}
}//클래스 끝










