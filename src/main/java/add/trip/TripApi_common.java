package add.trip;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.context.annotation.Configuration;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Configuration
public class TripApi_common {
	
	private static String getTagValue(String tag, Element eElement) {
		try {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if (nValue == null) {
				return null;
			}
			return nValue.getNodeValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	

	public static ArrayList<HashMap<String, String>> tripmethod() throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=Dokqp0w2r9tGEGJ6wGxYOO9xE2C74%2FnrPdRekUB%2F0%2Bv4v29gV3HMqNYtvS%2BPMaDmciNwczJ300CYKndZlW%2F2cw%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="+ URLEncoder.encode("인증키", "UTF-8")); /* 공공데이터포털에서 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="+ URLEncoder.encode("ETC", "UTF-8")); /* IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode("127718", "UTF-8")); /* 콘텐츠ID */	
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="+ URLEncoder.encode("", "UTF-8")); /* 관광타입(관광지, 숙박 등) ID */
		urlBuilder.append("&" + URLEncoder.encode("defaultYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 기본정보 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("firstImageYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 원본, 썸네일 대표이미지 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("areacodeYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 지역코드, 시군구코드 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("catcodeYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 대,중,소분류코드 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("addrinfoYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 주소, 상세주소 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("mapinfoYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 좌표 X,Y 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("overviewYN", "UTF-8") + "="+ URLEncoder.encode("Y", "UTF-8")); /* 콘텐츠 개요 조회여부 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
			System.out.println("파싱할 리스트 수 : " + nList.getLength());
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					hm = new HashMap<String, String>();
					Element eElement = (Element) nNode;

					hm.put("addr1", getTagValue("addr1", eElement));
					hm.put("firstimage", getTagValue("firstimage", eElement));
					hm.put("homepage", getTagValue("homepage", eElement));
					hm.put("overview", getTagValue("overview", eElement));
					hm.put("title", getTagValue("title", eElement));
				}
				list.add(hm);
			}
		} catch (Exception e) {
		}
		
		return list;
	}

	
	
}
