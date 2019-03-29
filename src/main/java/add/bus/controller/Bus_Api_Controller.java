package add.bus.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import add.bus_annomaps.AnnoMaps;
import add.bus_api.Bus_Api;


//Restful 사용
@RestController
public class Bus_Api_Controller {
   
   @Autowired
   AnnoMaps amap;
   @Autowired
   Bus_Api ap;
   
   // 클릭해서 ajax를 통해서 post형식으로 클릭한 값을 가져와 RequestParam 가져옴
   // 가져온 뒤 list에 담아 리턴 - 가져와 뿌려주기 위해서
   @ResponseBody
   @RequestMapping(value= {"/api_ajax"}, method=RequestMethod.POST)
   public ArrayList<HashMap<String, String>> api_test1(@RequestParam("do_name") String do_name){
      ArrayList<HashMap<String, String>> al = new ArrayList<HashMap<String, String>>();      
      al = amap.getApoSi(do_name);
      return al;
   }
   
   @ResponseBody
   @RequestMapping(value= {"/api_search"}, method=RequestMethod.GET)
   public ArrayList<HashMap<String, String>> api_test2(@RequestParam Map<String, String> m) throws IOException{
      ArrayList<HashMap<String, String>> list = ap.busApi(m.get("start_terminal"), m.get("arrival_terminal"), m.get("date"));
      
      // 검색한 버스가 있을경우만 실행
      if(!list.isEmpty()) {
      // 경로코드 함수
         HashMap<String, String> routemap = amap.getTerCode(list.get(0).get("depPlaceNm"), list.get(0).get("arrPlaceNm"));
         String routecode = String.valueOf(routemap.get("TER_CODE"));
         String day = String.valueOf(list.get(0).get("day"));
                  
         // 경로코드와 날짜를 버스스케쥴에서 검색후 값이 없을 경우
         if(amap.dbCheck(day, routecode) <= 0) {
            System.out.println("db에 값이 없음");
            // 반복하면서 검색한 내용을 스케쥴에 인서트
            for(int i=0; i<list.size(); i++) {
               HashMap<String, String> insertmap = new HashMap<String, String>();
               insertmap.put("grade", list.get(i).get("gradeNm"));
               insertmap.put("company", String.valueOf(((int)(Math.random()*8)+1)));
               insertmap.put("routecode", routecode);
               insertmap.put("day", day);
               insertmap.put("depPlandTime", list.get(i).get("depPlandTime"));
               insertmap.put("arrPlandTime", list.get(i).get("arrPlandTime"));
               insertmap.put("charge", list.get(i).get("charge"));
               
               amap.insertSchedule(insertmap);
            }
            return amap.getScheduel(day, routecode);
            
         }else {
            System.out.println("db에 값이 있음");
            return amap.getScheduel(day, routecode);
         }
      // 검색한 버스 조회가 없을 경우
      }else {
         return list;
      }
   }
    @ResponseBody
	@RequestMapping(value= {"/ajax_seat"}, method=RequestMethod.GET)
	public ArrayList<HashMap<String, String>> getSeatNum(@RequestParam("bus_seq") String bus_seq) {
		ArrayList<HashMap<String, String>> list = amap.getSeatNumber(bus_seq);
		return list;
	}
}