package add.movie.controller;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

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
	public ModelAndView Movie_main() throws Exception {
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
	
	@RequestMapping(value= {"/reservation"}, method=RequestMethod.GET)
	public ModelAndView reservation() {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	      Date currentTime = new Date();
	      Calendar c = Calendar.getInstance();
	      ArrayList<HashMap<String, String>> daylist = new ArrayList<HashMap<String, String>>();
	      HashMap<String, String> daydate =  null;
	      String day =null;
  	  String dates = null;
	      for(int i=0;i<7; i++) {
	    	  daydate=new HashMap<String, String>();
	    	  c.setTime(currentTime);
	    	  c.add(Calendar.DATE, i);
	    	  dates =formatter.format(c.getTime());
	    	  dates = dates.substring(8);
	    	  int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
	    	  	switch(dayOfWeek) {
	    	  	case 1: day = "일"; break ;
	    	  	case 2: day = "월"; break ;
	    	  	case 3: day = "화"; break ;
	    	  	case 4: day = "수"; break ;
	    	  	case 5: day = "목"; break ;
	    	  	case 6: day = "금"; break ;
	    	  	case 7:day = "토"; break ;
	    	  	}
	    	  daydate.put("dates", dates);
	    	  daydate.put("days", day);
	    	  daylist.add(daydate);
	      }
	      
	      mv.addObject("daylist", daylist);
		mv.setViewName("reservation");
		return mv;
	}
}
