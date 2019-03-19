package add.movie.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import add.movie.MovieJSONMain;
import add.movie.NaverApi;

@org.springframework.stereotype.Controller
@RequestMapping("/movie")
public class Movie_Controller {
	@Autowired
	Connection con;
	
	@Autowired
	NaverApi na;
	
	@Autowired
	MovieJSONMain mj;
	
	@RequestMapping(value= {"/main"}, method=RequestMethod.GET)
	public ModelAndView Movie_main() {
		ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String, String>>();
		ModelAndView mv = new ModelAndView();

		mv.addObject("movie", mj.Mm());
		mv.setViewName("movie_main");

		return mv;
	}
	
	@RequestMapping(value= {"/detail_view"}, method=RequestMethod.GET)
	public ModelAndView detail_view(@RequestParam HashMap<String, String> m){
		ModelAndView mv = new ModelAndView();
		String movieCd = m.get("movieCd");
		String movieNm = (String) mj.MV(movieCd).get("movieNm");
		String img = na.NaverApi(movieNm).get("image");
		String userRating = na.NaverApi(movieNm).get("userRating");
		
		mv.addObject("img", img);
		mv.addObject("rating", userRating);
		mv.addObject("movie", mj.MV(movieCd).get("movie_view"));
		mv.setViewName("detail_view");
		
		return mv;
	}
}
