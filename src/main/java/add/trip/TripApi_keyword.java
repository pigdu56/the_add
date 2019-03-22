package add.trip;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.context.annotation.Configuration;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Configuration
public class TripApi_keyword {
	
	private static String getTagValue(String tag, Element eElement) {
	      try {
	         NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	         Node nValue = (Node) nlList.item(0);
	         if (nValue == null) {
	            return null;
	         }
	         return nValue.getNodeValue();
	      }catch (Exception e) {
	         // TODO: handle exception         
	         e.printStackTrace();
	         return null;
	      }      
	   }

	

	public ArrayList<HashMap<String, String>> tripkey(String key) throws IOException{
		
			key = Objects.isNull(key) || key =="" ? "서울" : key; 
		
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=Dokqp0w2r9tGEGJ6wGxYOO9xE2C74%2FnrPdRekUB%2F0%2Bv4v29gV3HMqNYtvS%2BPMaDmciNwczJ300CYKndZlW%2F2cw%3D%3D"); /*Service Key*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND(안드로이드), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록 구분 (Y=목록, N=개수)*/
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬(O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*지역코드*/
	        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드(areaCode 필수)*/
	        urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
	        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류 코드(cat1필수)*/
	        urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
	        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(key, "UTF-8")); /*검색 요청할 키워드 (국문=인코딩 필요)*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
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
	        
	        String xml = sb.toString();
	        
	        ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
	        HashMap<String, String> hm = null;
	        
	        try {
	        	String urls = url.toString();
	        	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	            Document doc = dBuilder.parse(urls);
	            // root tag
	            doc.getDocumentElement().normalize();
	            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
	            // 파싱할 tag
	            NodeList nList = doc.getElementsByTagName("item");
	            System.out.println("파싱할 리스트 수 : "+ nList.getLength());
	            for (int temp = 0; temp < nList.getLength(); temp++) {
	            	Node nNode = nList.item(temp);
	            	if (nNode.getNodeType() == Node.ELEMENT_NODE) {
	            		hm = new HashMap<String, String>();
	             		Element eElement = (Element) nNode;  
	             		
	             		hm.put("addr1", getTagValue("addr1", eElement));
	             		hm.put("contentid", getTagValue("contentid", eElement));
	             		hm.put("contenttypeid", getTagValue("contenttypeid", eElement));
	             		hm.put("firstimage", getTagValue("firstimage", eElement));
	             		hm.put("firstimage2", getTagValue("firstimage2", eElement));
	             		hm.put("tel", getTagValue("tel", eElement));
	             		hm.put("title", getTagValue("title", eElement));
	             		
	        }
	            	list.add(hm);
				// for end
			} // if end
				// while end
		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end
		return list;
	}
}