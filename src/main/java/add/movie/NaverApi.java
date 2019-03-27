package add.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.annotation.Configuration;

@Configuration
public class NaverApi {
	public NaverApi() {
	}

	public HashMap<String, String> NaverApi(String movieNm) {
		String clientId = "8Zs2leAth5ub9RwZpaw8";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "Rs9y6LyLHU";// 애플리케이션 클라이언트 시크릿값";
		try {			
			String m_title = URLEncoder.encode(movieNm, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ m_title; // json 결과
			// // xml 결과
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			String json = res.toString();
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse( json );
			JSONObject jsonObj = (JSONObject) obj;
			ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>) jsonObj.get("items");			
			for(HashMap<String, String> m : list) {	
				
				return m;
			}		
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}
