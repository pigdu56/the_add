package add.bus.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = { "/buspractice" }, method = RequestMethod.GET)
	public String busparctice() {
		return "buspractice";
	}
	
	// 버스 검색
	@RequestMapping(value = { "/ticketing" }, method = RequestMethod.GET)
	public String ticketing(ModelMap m) {
		m.addAttribute("dolist", amap.getApiDo());
		return "ticketing";
	}
	
	// 버스 좌석
	@RequestMapping(value= {"/bus_seat"}, method = RequestMethod.POST)
	public String ajaxSeat(ModelMap m, @RequestParam HashMap<String, String> map) {
		m.addAttribute("bus_ticket", map);
		m.addAttribute("member_num", String.valueOf(amap.memberNum(String.valueOf(((HashMap)m.get("bus_ticket")).get("id")))));
		return "bus_seat";
	}
	
	// 예약
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
	
	// 관리자 모드 예약 리스트
	@RequestMapping(value= {"/admin_list"})
	public String admin_buy_list(ModelMap m) {
		m.addAttribute("admin_buy_list", amap.admin_buy_list());
		return "admin_list";
	}
	
	// 클릭시 그 정보에 대한 표 나오게 하기
	@RequestMapping(value= {"/buy_view"})
	public String buy_view(ModelMap m, @RequestParam("b_code") String b_code) {
		m.addAttribute("member_buy_impormation" ,amap.member_buy_list(b_code));
		return "buy_view";
	}
	
	// 멤버의 예약 리스트
	@RequestMapping(value= {"/member_buylist"})
	public String member_buylist(HttpSession s, ModelMap m) {
		String m_num = (String) s.getAttribute("LoginNum");
		m.addAttribute("user_list", amap.user_buy_list(m_num));
		return "member_buylist";
	}
}
