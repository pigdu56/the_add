package add.movie;


import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;
import org.springframework.context.annotation.Configuration;

import com.mongodb.MongoClient;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@Configuration
public class Mongo {
	/*몽고디비 커넥션*/
	//가.클라이언트
	MongoClient mc = new MongoClient("10.0.0.53", 27017);
	
	//나. 테이터베이스
	MongoDatabase mdb = mc.getDatabase("the_add");
	
	//예매완료 후 값 영화 저장
	public void insertCinema(HashMap<String, String> map) {
		MongoCollection<Document> coll = mdb.getCollection("cinema");
		Document doc = new Document();
		String time = String.valueOf(map.get("T_TIME"));
		time = time.substring(0, 2);
		int t_time = Integer.parseInt(time);
		String gender = String.valueOf(map.get("M_GENDER"));
		if(gender == null) {
			gender = "0";
		}
		int m_gender = Integer.parseInt(gender);
		String num = String.valueOf(map.get("m_num"));
		int m_num = Integer.parseInt(num);
		doc.append("c_name", map.get("C_NAME"));
		doc.append("gender", m_gender);
		doc.append("t_time", t_time);
		doc.append("m_num", m_num);
		coll.insertOne(doc);		
	}
	//예매완료 후 값 장르 저장
	public void insertGenre(HashMap<String, String> map, String genre) {
		MongoCollection<Document> coll = mdb.getCollection("genre");
		Document doc = new Document();
		String gender = String.valueOf(map.get("M_GENDER"));
		String num = String.valueOf(map.get("m_num"));
		int m_num = Integer.parseInt(num);
		if(gender == null) {
			gender = "0";
		}
		int m_gender = Integer.parseInt(gender);
		doc.append("gender", m_gender);
		doc.append("genre", genre);
		doc.append("m_num", m_num);
		coll.insertOne(doc);	
	}
	//이용가 저장
	public void insertRating(HashMap<String, String> map) {
		MongoCollection<Document> coll = mdb.getCollection("rating");
		Document doc = new Document();
		String num = String.valueOf(map.get("m_num"));
		int m_num = Integer.parseInt(num);
		doc.append("rt_rating", map.get("RT_RATING"));
		doc.append("m_num", m_num);
		coll.insertOne(doc);
	}
	//장르선호도
	public Iterator<Document> getGenre() {
		MongoCollection<Document> coll = mdb.getCollection("genre");
		//장르 group
		Document genreGroup = new Document("$group", new Document(
				"_id", "$genre")
				.append("count", new Document("$sum", 1)));
		List<Document> pipeline = Arrays.asList(genreGroup);
		AggregateIterable<Document> aggs = coll.aggregate(pipeline);
		Iterator<Document> it = aggs.iterator();
		System.out.println(it);
		return it;
	}
	//영화관선호
	public Iterator<Document> getCinema() {
		MongoCollection<Document> coll = mdb.getCollection("cinema");
		//장르 group
		Document genreGroup = new Document("$group", new Document(
				"_id", "$c_name")
				.append("count", new Document("$sum", 1)));
		List<Document> pipeline = Arrays.asList(genreGroup);
		AggregateIterable<Document> aggs = coll.aggregate(pipeline);
		Iterator<Document> it = aggs.iterator();
		System.out.println(it);
		return it;
	}
	//연령별선호
		public Iterator<Document> getRating() {
			MongoCollection<Document> coll = mdb.getCollection("rating");
			//장르 group
			Document genreGroup = new Document("$group", new Document(
					"_id", "$rt_rating")
					.append("count", new Document("$sum", 1)));
			List<Document> pipeline = Arrays.asList(genreGroup);
			AggregateIterable<Document> aggs = coll.aggregate(pipeline);
			Iterator<Document> it = aggs.iterator();
			return it;
		}
	
	
}
