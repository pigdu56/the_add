package add.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import add.maps.TestMappable;

@RestController
@RequestMapping("/")
public class RestLoginController {
   @Autowired
   TestMappable testMappable;
   
    @ResponseBody
    @RequestMapping(value= {"/gf_login"}, method = RequestMethod.POST)
    public String restLogin(@RequestParam HashMap<String, Object> m, HttpSession s) {      
    	HashMap<String, Object> hm = testMappable.selectID((String) m.get("id"));
    	if(hm == null) {
    		testMappable.insertLogin(m);
    	}
    	s.setAttribute("LoginUser", m.get("id"));
    	return "login";
	}
}