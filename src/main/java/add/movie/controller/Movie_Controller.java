package add.movie.controller;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import add.movie.MovieJSONMain;
import add.movie.NaverApi;
import add.movie.maps.MovieMappable;

@org.springframework.stereotype.Controller
@RequestMapping("/movie")
public class Movie_Controller {
	@Autowired
	Connection con;
	
	@Autowired
	NaverApi na;
	
	@Autowired
	MovieJSONMain mj;
	
	@Autowired
	MovieMappable mm;
	
	@RequestMapping(value= {"/main"}, method=RequestMethod.GET)
	public ModelAndView Movie_main() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("movie", mm.mv_select());
		mv.setViewName("movie_main");
		System.out.println(mv);
		
		return mv;
	}
	
	@RequestMapping(value= {"/detail_view"}, method=RequestMethod.GET)
	public ModelAndView detail_view(@RequestParam HashMap<String, String> m){
		ModelAndView mv = new ModelAndView();
		String movieCd = m.get("movieCd");
		mv.addObject("movie", mj.MV(movieCd).get("movie_view"));
		mv.setViewName("detail_view");
		
		return mv;
	}
	//예약 페이지
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
	
	//좌석선택
	@RequestMapping(value= {"/reservation_seat"}, method=RequestMethod.GET)
	public ModelAndView getSeat() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("reservation_seat");
		return mv;
	}
	
	@RequestMapping(value= {"/registration"}, method=RequestMethod.GET)
	public ModelAndView getRegist() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("registration");
		return mav;
	}
	
	// 영화 등록
   @RequestMapping(value= {"/mv_insert"}, method=RequestMethod.GET)
   public String mv_insert() throws Exception {
      ArrayList<HashMap<String, String>> list = mj.Mm();
      HashMap<String, Object> m = null;
      HashMap<String, String> dtm = null;
      StringTokenizer tokens = null;
      mm.mv_update();
      for(HashMap<String,String> hm : list) {
         dtm = new HashMap<String, String>();
         	         
         // 순위
         String rnum = hm.get("rnum");
         dtm.put("rnum", rnum);
         
         // 포스터
         tokens = new StringTokenizer(hm.get("posters"));
         String poster = tokens.nextToken("|");
         dtm.put("poster", poster);
         //System.out.println("포스터 : " + poster);
         
         // 줄거리
         String story = hm.get("plot");
         dtm.put("story", story);
         //System.out.println("줄거리 : " + story);
         
         /* 영화 상세 정보 */
         m = (HashMap<String, Object>) mj.MV(hm.get("movieCd")).get("movie_view");
         //System.out.println(m);
         
         // 제목(한)
         String title_kr = (String) m.get("movieNm");
         dtm.put("title_kr", title_kr);
         //System.out.println("title_kr : " + title_kr);
         
         // 제목(영)
         String title_en = (String) m.get("movieNmEn");
         dtm.put("title_en", title_en);
         //System.out.println("title_en : " + title_en);
         
         // 국가
         ArrayList<HashMap<String, String>> country = (ArrayList<HashMap<String, String>>) m.get("nations");
         for(HashMap<String, String> c : country) {
            String ct = c.get("nationNm");
            dtm.put("ct", ct);
            //System.out.println("국가 : " + ct);
         }
         
         // 개봉일
         String odt = (String) m.get("openDt");
         dtm.put("odt", odt);
         //System.out.println("개봉일 : " + odt);
         
         // 상영 시간
         String st = (String) m.get("showTm");
         dtm.put("st", st);
         //System.out.println("상영 시간 : " + st);
         
         // 상영 등급
         ArrayList<HashMap<String, String>> audit = (ArrayList<HashMap<String, String>>) m.get("audits");
         String sg = audit.get(0).get("watchGradeNm");
         dtm.put("sg", sg);
         //System.out.println("상영 등급 : " + sg);
         
         // 평점
         String rating = na.NaverApi(title_kr).get("userRating");
         dtm.put("rating", rating);
         //System.out.println(rating);
         
         int mv_c = Integer.parseInt(mm.mv_insert(dtm));
         
         // 감독
         ArrayList<HashMap<String, String>> director = (ArrayList<HashMap<String, String>>) m.get("directors");
         for(HashMap<String, String> d : director) {
            String dt = d.get("peopleNm");
            mm.dt_insert(mv_c, dt);
            //System.out.println("감독 : " + dt);
         }
         
         // 배우
         ArrayList<HashMap<String, String>> actor = (ArrayList<HashMap<String, String>>) m.get("actors");
    	 if(actor.isEmpty()) {
    		 String ac = na.NaverApi(title_kr).get("actor");
    		 System.out.println(ac);
    		 String date[] = ac.split("\\|");
    	        
	        for(int i=0 ; i<date.length ; i++) {
	        	String at = date[i];
	        	mm.at_insert(mv_c, at);
	            //System.out.println("배우 : " + at);
	        }

    	 } else {
	         for(HashMap<String, String> a : actor) {
	            String at = a.get("peopleNm");
	            mm.at_insert(mv_c, at);
	            //System.out.println("배우 : " + at);
	    	 }
    	 }

         // 장르
         ArrayList<HashMap<String, String>> genre = (ArrayList<HashMap<String, String>>) m.get("genres");
         for(HashMap<String, String> g : genre) {
            String gr = g.get("genreNm");
            mm.gr_insert(mv_c, gr);
            //System.out.println("장르 : " + gr);
         }
      }
      
      return "redirect:/movie/main";
   }
}
