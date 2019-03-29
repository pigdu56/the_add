package add.movie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

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
		if(result == 1) {
			return "상영중!!";
		} else {
			return null;
		}
	}
}
