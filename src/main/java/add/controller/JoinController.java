package add.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import add.maps.AES256Util;
import add.maps.TestMappable;

@Controller
public class JoinController {

	@Autowired
	TestMappable testMappable;

	// 회원가입폼
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String joinForm() { 
		return "member_join";
	}

	// 회원가입 처리
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String join(@RequestParam HashMap<String, String> m) throws Exception {
		
		String userPw = m.get("f_pw");
		
		String key = "aes256_test_key!!";
		AES256Util aes256 = new AES256Util(key);
		// 비밀번호 암호화
		userPw = aes256.encrypt(userPw);
		
		//System.out.printf("m: '%s',회원가입 pw = '%s' \n", m, userPw);
		m.put("userPw", userPw);
		// DB에 회원정보 저장
		testMappable.join(m);
		
		return "redirect:/login";
	}



}
