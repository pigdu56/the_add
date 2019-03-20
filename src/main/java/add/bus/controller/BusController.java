package add.bus.controller;

import java.sql.Connection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.stereotype.Controller
@RequestMapping("/bus")
public class BusController {
	@Autowired
	Connection con;
	
	@RequestMapping(value = { "/main" }, method = RequestMethod.GET)
	public String main() {
		return "bus_main";
	}
	

	@RequestMapping(value = { "/about" }, method = RequestMethod.GET)
	public String about() {
		return "bus_about";
	}
	
}
