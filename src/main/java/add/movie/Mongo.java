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
		MongoCollection<Document> coll = mdb.getCollection("mv");
		Document doc = new Document();
		Map<String, Object> ms = new HashMap<String, Object>();
		List<Object> al = new ArrayList<Object>();		
		String genre = map.get("G_NAME");
		if(genre.contains(",")) {
			String[] genres = genre.split(",");
			for(String s : genres) {					
				al.add(s);
			}				
		}else {
			al.add(genre);
		}
		String day = String.valueOf(map.get("SD_DAY"));
		int sd_day = Integer.parseInt(day);
		String time = String.valueOf(map.get("T_TIME"));
		time = time.substring(0, 2);
		int t_time = Integer.parseInt(time);
		String gender = String.valueOf(map.get("M_GENDER"));
		int m_gender = Integer.parseInt(gender);
		doc.append("mv_title_kr", map.get("MV_TITLE_KR"));
		doc.append("mv_title_en", map.get("MV_TITLE_EN"));
		doc.append("rt_rating", map.get("RT_RATING"));
		doc.append("genre", al);
		doc.append("c_name", map.get("C_NAME"));
		doc.append("sd_day", sd_day);
		doc.append("t_time", t_time);
		doc.append("sex", m_gender);
		
		coll.insertOne(doc);
		
		FindIterable<Document> a= coll.find();		
	}
}
