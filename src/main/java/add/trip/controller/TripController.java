package add.trip.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import add.trip.TripApi;
import add.trip.TripApi_common;
import add.trip.TripApi_keyword;




@org.springframework.stereotype.Controller
@RequestMapping("trip")
public class TripController {
	@Autowired
	TripApi ta;
	@Autowired	
	TripApi_common ta21;
	@Autowired	
	TripApi_keyword tkey;
	


	
	@RequestMapping(value = { "/timg" }, method = RequestMethod.GET)
	public ModelAndView tripImg(HttpServletRequest request) throws IOException, ParseException {
		ModelAndView mv = new ModelAndView();
		String ti = request.getParameter("title");			
		System.out.println("타이틀:" + ti);   		
		mv.addObject("list", ta.tripapi(ti));		
		System.out.println("mv = " + mv);
		mv.setViewName("timg");		
		return mv;
	}
	
	@RequestMapping(value= {"/tcommon"}, method = RequestMethod.GET)
	public ModelAndView trip0321() throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ta21.tripmethod());
		mv.setViewName("tcommon");
			
		return mv;
		
	}

	@RequestMapping(value= {"/tkey"}, method=RequestMethod.GET)
	public ModelAndView tkey(HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView();
		String key = request.getParameter("key");
		mv.addObject("list", tkey.tripkey(key));
		mv.setViewName("tkey");		
		return mv;
	}
	
}

