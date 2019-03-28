package add.movie.controller;

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
		return mm.mv_dt_sel(map);
	}
}
