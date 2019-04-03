package add.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@Configuration
public class Mongo {
	/*몽고디비 커넥션*/
	//가.클라이언트
	MongoClient mc = new MongoClient("10.0.0.53", 27017);
	
	//나. 테이터베이스
	MongoDatabase mdb = mc.getDatabase("the_add");
	
	//예매완료 후 값 저장
	public void insertMongo(HashMap<String, String> map) {
		MongoCollection<Document> coll = mdb.getCollection("reservation");
		Document doc = new Document();
		Map<String, Object> ms = new HashMap<String, Object>();
		List<Object> al = new ArrayList<Object>();		
		String num = String.valueOf(map.get("m_num"));
		int m_num = Integer.parseInt(num);
		String time = String.valueOf(map.get("T_TIME"));
		time = time.substring(0, 2);
		int t_time = Integer.parseInt(time);
		String gender = String.valueOf(map.get("M_GENDER"));
		if(gender == null) {
			gender = "0";
		}
		int m_gender = Integer.parseInt(gender);
		String genre = map.get("G_NAME");
		if(genre.contains(",")) {
			String[] genres = genre.split(",");
			for(String s : genres) {					
				al.add(s);
			}				
		}else {
			al.add(genre);
		}
		HashMap<String, Object> movie = new HashMap<String, Object>();
		movie.put("mv_title_kr", map.get("MV_TITLE_KR"));
		movie.put("rt_rating", map.get("RT_RATING"));
		movie.put("genre", al);
		
		HashMap<String, Object> cinema = new HashMap<String, Object>();
		cinema.put("c_name", map.get("C_NAME"));
		cinema.put("movie", movie);
		cinema.put("t_time", t_time);
		
		HashMap<String, Object> member = new HashMap<String, Object>();
		member.put("m_num", m_num);
		member.put("m_gender", m_gender);
		member.put("cinema", cinema);
		
		doc.append("member", member);
		
		coll.insertOne(doc);		
	}
	
	
}
