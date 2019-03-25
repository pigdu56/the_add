package add.movie;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection; 
import java.net.URL; 
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.annotation.Configuration;

import java.io.BufferedReader; 


@Configuration
public class KmdbApi {
	
	public HashMap<String, Object> kmdb(Object movieNm, Object openDt) throws Exception{
		/*URL*/
		StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); 
		
		/*Service Key*/ 
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8")+"="+URLEncoder.encode("5CXKMULO4I6N586J47J3", "UTF-8")); 
		
		/*상세정보*/
		urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); 
		String mNm = null; 
		mNm = (String) movieNm;
		/*영화제목*/
		urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(mNm, "UTF-8")); 
		
		/*개봉일자*/
		String oDt = null; 
		oDt =(String) openDt;
		oDt	= oDt.replaceAll("[-]", "");
		urlBuilder.append("&" + URLEncoder.encode("releaseDts","UTF-8") + "=" + URLEncoder.encode(oDt, "UTF-8")); 
		
		URL url = new URL(urlBuilder.toString()); 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		conn.setRequestMethod("GET"); conn.setRequestProperty("Content-type", "application/json"); 
		BufferedReader rd; 
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { 
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else { 
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
		} 
		StringBuilder sb = new StringBuilder(); 
		String line; 
		while ((line = rd.readLine()) != null) {
			sb.append(line); 
		} 
		rd.close(); 
		conn.disconnect();
		String json = sb.toString();
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( json );
		JSONObject jsonObj = (JSONObject) obj;
		ArrayList<HashMap<String, Object>> list = null; 
		list =(ArrayList<HashMap<String, Object>>) jsonObj.get("Data");
		ArrayList<HashMap<String, Object>> result = null;
		result = (ArrayList<HashMap<String, Object>>) list.get(0).get("Result");
		for(HashMap<String, Object> m : result) {				
			return m;
		}
		return null; 
	}
}

