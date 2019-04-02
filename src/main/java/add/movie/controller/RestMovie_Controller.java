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
	public int multiUser(@RequestParam(value= "s_name[]") ArrayList<String> s_name,@RequestParam(value="sd_code") String sd_code, HttpServletRequest rq) {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		System.out.println("s_name : " + s_name + "sd_code : " + sd_code );
		HttpSession s = rq.getSession();
		String user = (String) s.getAttribute("LoginUser");
		System.out.println(user);
		
		
		
		
		return 0;
	}
	
	
}
