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

import add.trip.controller.TripController;

@Configuration
public class TripApi {
	
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
	
    public ArrayList<HashMap<String, String>> tripapi(String ti) throws IOException {
    	
    	
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/gallerySearchList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=Dokqp0w2r9tGEGJ6wGxYOO9xE2C74%2FnrPdRekUB%2F0%2Bv4v29gV3HMqNYtvS%2BPMaDmciNwczJ300CYKndZlW%2F2cw%3D%3D"); /*Service Key*/
		/*
		 * urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +
		 * URLEncoder.encode("-", "UTF-8"));
		 */ /*공공데이터포털에서 받은 인증키*/
               
        ti = Objects.isNull(ti) || ti == ""? "서울" : ti;        
        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN( 윈도우폰), ETC(WEB이나 기타 등등)*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*A=촬영일, B=제목, C=수정일, D=조회수*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(ti, "UTF-8")); /*요청 키워드(한글 경우,URL인코딩 필요)*/
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
        System.out.println(sb.toString());
        
        try {
            // parsing할 url 지정(API 키 포함해서)
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
             		
             		hm.put("galContentId", getTagValue("galContentId", eElement));
             		hm.put("galContentTypeId", getTagValue("galContentTypeId", eElement));
             		hm.put("galCreatedtime", getTagValue("galCreatedtime", eElement));
             		hm.put("galModifiedtime", getTagValue("galModifiedtime", eElement));
             		hm.put("galPhotographer", getTagValue("galPhotographer", eElement));
             		hm.put("galPhotographyLocation", getTagValue("galPhotographyLocation", eElement));
             		hm.put("galPhotographyMonth", getTagValue("galPhotographyMonth", eElement));
             		hm.put("galTitle", getTagValue("galTitle", eElement));
             		hm.put("galViewCount", getTagValue("galViewCount", eElement));
             		hm.put("galWebImageUrl", getTagValue("galWebImageUrl", eElement));
             		hm.put("galSearchKeyword", getTagValue("galSearchKeyword", eElement));
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