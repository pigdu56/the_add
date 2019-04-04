package add.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import add.movie.Mongo;

@org.springframework.stereotype.Controller
@RequestMapping("/movie")
public class MongonMovie_Controller {
	
	@Autowired
	Mongo mg;
	
	@RequestMapping(value = {"/preference"}, method = RequestMethod.GET)
	public ModelAndView Preference() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("rating", mg.getRating());
		mv.addObject("cinema", mg.getCinema());
		mv.addObject("genre", mg.getGenre());
		mv.setViewName("preference");
		return mv;
	}
}
