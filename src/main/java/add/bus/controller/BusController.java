package add.bus.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value= {"/bus_seat"}, method = RequestMethod.GET)
	public String ajaxSeat(ModelMap m, @RequestParam HashMap<String, String> map) {
		m.addAttribute("bus_ticket", map);
		m.addAttribute("member_num", String.valueOf(amap.memberNum(String.valueOf(((HashMap)m.get("bus_ticket")).get("id")))));
		return "bus_seat";
	}
	
	@RequestMapping(value= {"/seat_ticket"}, method = RequestMethod.POST)
	public String seat_ticket(ModelMap m, @RequestParam("b_seatnum") ArrayList<String> ss,@RequestParam HashMap<String, String> map) {
		// 예약 인서트(회원번호 추가해야함)
		amap.buyInsert(map.get("member_num"), map.get("bus_seq"));
		
		// 예약 (회원 번호, 스케쥴 코드를 받아와 가장 마지막 예약번호 가져오기)
		int seq = amap.buySeq(map.get("member_num"), map.get("bus_seq"));
		
		// 선택한 좌석이 있을 경우
		if(!ss.isEmpty()) {
			for(int i=0; i<ss.size(); i++) {
				amap.seatInsert(String.valueOf(seq), ss.get(i));
			}
			// 버스 스케쥴에 대한 예약 목록 가죠오기
			m.addAttribute("buy_list", amap.buy_list(map.get("member_num"), map.get("bus_seq")));
		}
		return "seat_ticket";
	}
}
