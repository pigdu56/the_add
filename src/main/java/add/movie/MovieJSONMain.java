package add.movie;

import java.io.BufferedInputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MovieJSONMain {
	@Autowired
	NaverApi na;
	
	@Autowired
	KmdbApi ka;

	
	public MovieJSONMain() {
		
	}
	
	// 박스오피스 주간 정보
	private static String readUrl() throws Exception {
		BufferedInputStream reader = null;
		// 하루 전 날짜
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		cal.add(cal.DATE, -5);
		String yesterday = date.format(cal.getTime());
		
		try {
			URL url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=f831993857b52d6a24b646f46bcac4b4&targetDt="+ yesterday);
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}
	
	// 박스 오피스 영화 상세 정보
	private static String movie(String movieCd) throws Exception {
		BufferedInputStream reader = null;
		try {
			URL url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f831993857b52d6a24b646f46bcac4b4&movieCd="+ movieCd);
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			
			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}
	
	// 주간정보 호출 메서드
	public ArrayList<HashMap<String, String>> Mm() throws Exception {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>(); 
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject;
		try {
			jsonobject = (JSONObject) jsonparser.parse(readUrl());
			JSONObject json = (JSONObject) jsonobject.get("boxOfficeResult");
			JSONArray array = (JSONArray) json.get("weeklyBoxOfficeList");
			for (int i = 0; i < array.size(); i++) {
				JSONObject entity = (JSONObject) array.get(i);				
				list.add(entity);
			}			
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int j=0;j<list.size();j++) {			
			list.get(j).putAll(ka.kmdb(list.get(j).get("movieNm"), list.get(j).get("openDt")));
		}		
		return list;
	}
	
	// 영화 정보 호출 메서드
	   public HashMap<String, Object> MV(String movieCd){
	      HashMap<String, Object> m = new HashMap<String, Object>();
      
	      JSONParser jsonparser = new JSONParser();
	      JSONObject jsonobject;

	      try {
	         jsonobject = (JSONObject) jsonparser.parse(movie(movieCd));
	         JSONObject movieInfoResult = (JSONObject) jsonobject.get("movieInfoResult");
	         JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");
	         
	         m.put("movie_view", movieInfo);
	         m.put("movieNm", movieInfo.get("movieNm"));
	      } catch (Exception e) {
	         System.out.println("영화 상세 정보 호출 에러 : " + e.getMessage());
	      }
	      
	      return m;
	   }
}
