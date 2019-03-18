package add.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import add.maps.TestMappable;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/")
public class RestJoinController {
	@Autowired
	TestMappable tm;
	
	@ResponseBody
	@RequestMapping(value= { "/idcheck" }, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> idcheck(){
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		list = tm.idcheck();
		System.out.println(list);
		
		return list;
	}
}
