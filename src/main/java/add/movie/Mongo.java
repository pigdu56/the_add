package add.movie;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;
import org.springframework.context.annotation.Configuration;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
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
	
	//예매완료 후 이용가 저장
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
		return it;
	}
	
	// 연령별선호
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
	
	// 연령별 예매 선호도 저장
	public void insertAge(String mv_title_kr, int ag) {
		MongoCollection<Document> coll = mdb.getCollection("age");
		Document doc = new Document();	
		doc.append("age", ag);
		doc.append("mv_title_kr", mv_title_kr);
		coll.insertOne(doc);
	}
	
	// 연령별 예매 선호도	
	public Iterator<Document> getAge(String title){
		MongoCollection<Document> coll = mdb.getCollection("age");
		// 나이 age
		Document match = new Document("$match", new Document("mv_title_kr", title));
		Document ageGroup = new Document("$group", new Document(
				"_id", "$age").append("count", new Document("$sum", 1)));
		
		
		List<Document> pipeline = Arrays.asList(match, ageGroup);
		AggregateIterable<Document> aggs = coll.aggregate(pipeline);
		Iterator<Document> it = aggs.iterator();
		return it;
	}
	
	// 성별 영화 선호도 저장
	public void insertGenderMV(String mv_title_kr, int gd) {
		MongoCollection<Document> coll = mdb.getCollection("gender");
		Document doc = new Document();
		doc.append("gender", gd);
		doc.append("mv_title_kr", mv_title_kr);
		coll.insertOne(doc);
	}
	
	// 성별 영화 선호도 	
	public Iterator<Document> getGenderMV(String title){
		MongoCollection<Document> coll = mdb.getCollection("gender");
		// 성별
		Document match = new Document("$match", new Document("mv_title_kr", title));
		Document genderGroup = new Document("$group", new Document(
				"_id", "$gender").append("count", new Document("$sum", 1)));
		
		List<Document> pipeline = Arrays.asList(match, genderGroup);
		AggregateIterable<Document> aggs = coll.aggregate(pipeline);
		Iterator<Document> it = aggs.iterator();
		return it;
	}
	
	// 좋아요	Insert
	public void insertlike(int m_num) {
		MongoCollection<Document> coll = mdb.getCollection("mv");
		Document doc = new Document();
		doc.append("like", 0);
		doc.append("m_num", m_num);
		coll.insertOne(doc);
	}
	
	// 좋아요 find
	public ArrayList<Document> getlike(int m_num, String mv_title_kr){
		ArrayList<Document> list = new ArrayList<Document>();
		MongoCollection<Document> coll = mdb.getCollection("mv");
		BasicDBObject num = new BasicDBObject("m_num", m_num);
		BasicDBObject title = new BasicDBObject("mv_title_kr", mv_title_kr);
		
		BasicDBList mv = new BasicDBList();
		mv.add(num);
		mv.add(title);
		
		FindIterable<Document> fi = coll.find( new Document("$and", mv ));
        MongoCursor<Document> mongoCursor = fi.iterator();
        while (mongoCursor.hasNext()) {
        	Document doc = mongoCursor.next();
            list.add(doc);
        }
		
		return list;
	}
	
	// 좋아요 Update
	public void updatelike(int mv_num, String mv_title_kr, int like) {
		getlike(mv_num, mv_title_kr);
	}

}