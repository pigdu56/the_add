package add.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import add.movie.maps.MovieMappable;
//restful
@RestController
@RequestMapping("/movie")
public class RestMovie_Controller {
	
	@Autowired
	MovieMappable mm;
	
	//ajax 영화정보가져오기
	@ResponseBody
	@RequestMapping(value= {"/info"}, method = RequestMethod.GET)
	public HashMap<String, String> movieInfo(@RequestParam HashMap<String, String> map) {
		if(map.get("mv_code") != null) {
			return mm.mv_dt_sel(map);
		}else {
			return null;
		}
		
	}
	
	// 상영관 확인
	@ResponseBody
	@RequestMapping(value = {"/t_check"}, method = RequestMethod.POST)
	public String tt_sel(@RequestParam HashMap<String, String> m) {
		int result = mm.tt_sel(m);
		if(result == 0) {
			return null;
		} else {
			return "상영중!!";
		}
	}
	
	// 영화 선택후 영화관 리스트
	@ResponseBody
	@RequestMapping(value= {"/tc"}, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> tc(@RequestParam String mv_title_kr){
		return mm.tc(mv_title_kr);
	}
	
	// 영화관 선택 후 영화
	@ResponseBody
	@RequestMapping(value= {"/mv_c"}, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> mv_c(@RequestParam String c_name){
		return mm.mv_sel(c_name);
	}
	
	// 영화, 영화관, 날짜 선택시
	@ResponseBody
	@RequestMapping(value= {"/time"}, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> time(@RequestParam HashMap<String, String> map){
		return mm.time(map);
	}
	
	//영화, 영화관 선택 후 체크
	@ResponseBody
	@RequestMapping(value= {"/mv_c_check"}, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> mv_c_check(@RequestParam HashMap<String, String> map){
		
		return mm.mv_c_sel(map);
	}
	
	// 예약된 좌석
	@ResponseBody
	@RequestMapping(value= {"/seat"}, method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> seat(@RequestParam String sd_code){
		return mm.seat(sd_code);

	}
	
	// 동시 접속 제한
	@ResponseBody
	@RequestMapping(value= {"/multiUser"}, method = RequestMethod.POST)
	public int multiUser(@RequestParam(value= "s_name[]") ArrayList<String> s_name, @RequestParam(value="sd_code") String sd_code, HttpServletRequest rq) {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = null;
		
		System.out.println("s_name : " + s_name + "sd_code : " + sd_code );
		HttpSession s = rq.getSession();
		String user = (String) s.getAttribute("LoginUser");
		System.out.println(user);
		
		ArrayList<HashMap<String, String>> s_list = (ArrayList<HashMap<String, String>>) s.getAttribute("VS");
		boolean check = false;
		System.out.println("s_list : " + s_list);
		
		
		
		if(s_list == null) {			
			for(String str : s_name) {
				check = true;
				//System.out.println("dfds : " + check);
				map = new HashMap<String, String>();
				map.put("user", user);
				map.put("sd_code", sd_code);
				map.put("s_name", str);
				//System.out.println(map);
				list.add(map);
				//System.out.println("list2 : " + list);
			}
			s.setAttribute("VS", list);
		} else {

			for(HashMap<String, String> m : s_list) {
				if(m.get("user").equals(user)) {
					if(m.get("sd_code").equals(sd_code)) {
						for(String str : s_name) {
							if(m.get("s_name").equals(str) == false) {
								check = true;
								map = new HashMap<String, String>();
								map.put("user", user);
								map.put("sd_code", sd_code);
								map.put("s_name", str);
								list.add(map);
								//System.out.println("list3 : " + list);
							}
						}
						s.setAttribute("VS", list);
					} else {
						for(String str : s_name) {
							if(m.get("s_name").equals(str) == false) {
								check = true;
								map = new HashMap<String, String>();
								map.put("user", user);
								map.put("sd_code", sd_code);
								map.put("s_name", str);
								list.add(map);
								//System.out.println("list4 : " + list);
							}
						}
						s.setAttribute("VS", list);
					}
				} else {
					//System.out.println("dsfsf");
					if(m.get("sd_code").equals(sd_code)) {
						for(String str : s_name) {
							if(m.get("s_name").equals(str) == false) {
								check = true;
								map = new HashMap<String, String>();
								map.put("user", user);
								map.put("sd_code", sd_code);
								map.put("s_name", str);
								list.add(map);
								//System.out.println("list5 : " + list);
							}
						}
						s.setAttribute("VS", s_list);
					} else {
						for(String str : s_name) {
							if(m.get("s_name").equals(str) == false) {
								check = true;
								map = new HashMap<String, String>();
								map.put("user", user);
								map.put("sd_code", sd_code);
								map.put("s_name", str);
								list.add(map);
								//System.out.println("list6 : " + list);
							}
						}
						s.setAttribute("VS", list);
					}
				}
			}
		}
		
		if(check == true) {
			System.out.println("check : " + check);
			System.out.println("VS : " + s.getAttribute("VS"));
			return 0;
		} else if(check == false) {
			System.out.println("check : " + check);
			System.out.println("VS : " + s.getAttribute("VS"));
			return 1;
		}
		
		return 0;
	}
		
}
