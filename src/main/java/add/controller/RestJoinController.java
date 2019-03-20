package add.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@ResponseBody
	@RequestMapping(value = {"/id_Check"}, method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int id_Check(@RequestParam("f_id") String f_id){
		String id = f_id;
		int result = 0;
		System.out.println(tm.id_Check(id));
		if(String.valueOf(tm.id_Check(id).get("COUNT(*)")).equals("1")) {
			result = 1;
		}
		System.out.println(result);
		
		return result;
	}
}
