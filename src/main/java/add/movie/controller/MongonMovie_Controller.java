package add.movie.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
@RequestMapping("/movie")

public class MongonMovie_Controller {
	
	@RequestMapping("Preference")
	public ModelAndView Preference() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/preference");
		return mv;
	}
}
