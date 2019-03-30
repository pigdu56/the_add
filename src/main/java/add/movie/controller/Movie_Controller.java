package add.movie.controller;

import java.sql.Connection;
import java.text.ParseException;
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
	
	// 메인
	@RequestMapping(value= {"/main"}, method=RequestMethod.GET)
	public ModelAndView Movie_main() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("movie", mm.boxList());
		mv.setViewName("movie_main");
		
		return mv;
	}
	
	// 상세 정보
	@RequestMapping(value= {"/detail_view"}, method=RequestMethod.GET)
	public ModelAndView detail_view(@RequestParam HashMap<String, String> m){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("movie", mm.mv_dt_sel(m));
		mv.setViewName("detail_view");
		System.out.println(mv);
		return mv;
	}
	
	//예약 페이지
	@RequestMapping(value= {"/reservation"}, method=RequestMethod.GET)
	public ModelAndView reservation() {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date currentTime = new Date();
		Calendar c = Calendar.getInstance();
		ArrayList<HashMap<String, String>> daylist = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> daydate = null;
		String day = null;
		String dates = null;
		for (int i = 0; i < 7; i++) {
			daydate = new HashMap<String, String>();
			c.setTime(currentTime);
			c.add(Calendar.DATE, i);
			dates = formatter.format(c.getTime());
			dates = dates.substring(8);
			int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			switch (dayOfWeek) {
			case 1:
				day = "일";
				break;
			case 2:
				day = "월";
				break;
			case 3:
				day = "화";
				break;
			case 4:
				day = "수";
				break;
			case 5:
				day = "목";
				break;
			case 6:
				day = "금";
				break;
			case 7:
				day = "토";
				break;
			}
			daydate.put("dates", dates);
			daydate.put("days", day);
			daylist.add(daydate);
	    }
	      
	    mv.addObject("mv_list",mm.mv_select());
	    mv.addObject("daylist", daylist);
	    mv.setViewName("reservation");
		return mv;
	}
	
	//좌석선택
	@RequestMapping(value= {"/reservation_seat"}, method=RequestMethod.GET)
	public ModelAndView getSeat(@RequestParam HashMap<String, String> map) {
		ModelAndView mv = new ModelAndView();
		String sd_code = mm.SDC(map);
		
		mv.addObject("mv_list",map);
		mv.addObject("seat", mm.seat(sd_code));
		mv.setViewName("reservation_seat");
		System.out.println(mv);
		return mv;
	}
	
	// 관리자 등록
	@RequestMapping(value= {"/registration"}, method=RequestMethod.GET)
	public ModelAndView getRegist() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("movielist", mm.mv_select());
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
         if(title_en.equals("")) {
        	 title_en = " ";   	 
         } 
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
    		 //System.out.println(ac);
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
   
   // 상영 영화 등록
   @RequestMapping(value = {"/regi_ok"}, method = RequestMethod.POST)
   public String mv_in(@RequestParam HashMap<String, String> map) {
	   //System.out.println(map);
	   //두 날짜 사이 값 구하기
	   String d1 = map.get("odt");
	   String d2 = map.get("cdt");      
 	   
      
 	   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");      
 	   try {
 		   Date date = sdf.parse(d1);
 		   Date date2 = sdf.parse(d2);
         
 		   ArrayList<String> dates = new ArrayList<String>();
 		   Date startDate = date;
 		   while( startDate.compareTo( date2 ) <=0 ){
 			   dates.add(sdf.format(startDate));
 			   Calendar c = Calendar.getInstance();
 			   c.setTime(startDate);
 			   c.add(Calendar.DAY_OF_MONTH, 1);
 			   startDate = c.getTime();
 		   }
 		   System.out.println(dates);
 		   for(String s2 : dates) {  	
 			   map.put("sd_day", s2);
 			   
 			   String run = map.get("in_time");
 		 	   String start = map.get("f_time");
 		 	   String end = map.get("e_time");
 		       
 		 	   int runtime = Integer.parseInt(run);
 		 	   int st_time = Integer.parseInt(start);
 		 	   int en_time = Integer.parseInt(end);
 			   
 			   for(int i = st_time; i <= en_time;i+=runtime) {
 				   int hour =i/60;
	      		   int min = ((i*60)%3600)/60;
	      		   String h = Integer.toString(hour);
	      		   StringBuffer sb2 = new StringBuffer(h);
	      		   String m = Integer.toString(min);
	      		   StringBuffer sb = new StringBuffer(m);
	      		   if (hour < 10) {
	      			   sb2.insert(0, 0);
	      		   }
	      		   if (min < 10) {
	      			   sb.insert(0, 0);
	      		   }
	      		   String times = sb2.toString() + sb.toString();
	
	      		   map.put("t_time", times);			
	      		   //System.out.println("map" + map);
	      		   mm.mv_in(map);
	      		   
	      		}
 		   }
		} catch (ParseException e) {
	        e.printStackTrace();
		}
 	   
		return "redirect:/movie/main";
	}
}
