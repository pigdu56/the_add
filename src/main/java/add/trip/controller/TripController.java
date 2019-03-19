package add.trip.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import add.trip.TripApi;

@org.springframework.stereotype.Controller
@RequestMapping("trip")
public class TripController {
	@Autowired
	TripApi ta;
	
	@RequestMapping(value = { "/timg" }, method = RequestMethod.GET)
	public String tripImg(@RequestParam String query) throws IOException {
		String json = ta.tripapi(query);
		
		return "timg";
	}
}
