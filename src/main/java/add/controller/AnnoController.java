package add.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import add.maps.TestMappable;

@org.springframework.stereotype.Controller
@RequestMapping("/")
public class AnnoController {
	@Autowired
	Connection con;

	@Autowired
	TestMappable testMappable;

	@Autowired
	SqlSessionFactory sqlsession;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap m) {
		m.addAttribute("message", String.format("%s", testMappable.selectTest()));
		
		return "home";
	}


	@RequestMapping(value = { "/about" }, method = RequestMethod.GET)
	public String aboutPage() {
		return "about";
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(HttpServletRequest rq) {
		// RSA 키 생성
		LoginController.initRsa(rq);
		
		return "login";
	}
	
	@RequestMapping(value = { "/member_list" }, method = RequestMethod.GET)
	public ModelAndView member_list() {
		ModelAndView mv = new ModelAndView();		
		mv.addObject("list", testMappable.selectTest());
		mv.setViewName("member_list");
		
		return mv;
	}
	
}