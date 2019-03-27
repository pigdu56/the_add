package add.bus.controller;

import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import add.bus_annomaps.AnnoMaps;

@org.springframework.stereotype.Controller
@RequestMapping("/bus")
public class BusController {
	@Autowired
	Connection con;
	@Autowired
	AnnoMaps amap;
	
	@RequestMapping(value = { "/main" }, method = RequestMethod.GET)
	public String main() {
		return "bus_main";
	}
	

	@RequestMapping(value = { "/about" }, method = RequestMethod.GET)
	public String about() {
		return "bus_about";
	}
	
	@RequestMapping(value = { "/ticketing" }, method = RequestMethod.GET)
	public String ticketing(ModelMap m) {
		m.addAttribute("dolist", amap.getApiDo());
		return "ticketing";
	}
}
