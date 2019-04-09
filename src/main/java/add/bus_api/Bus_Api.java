package add.bus_api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class Bus_Api {

   // 파싱하기
   private static String getTagValue(String tag, Element e) {
      try {
         NodeList nl = e.getElementsByTagName(tag).item(0).getChildNodes();
         Node nv = (Node) nl.item(0);
         if (nv == null) {
            return null;
         }
         return nv.getNodeValue();
      } catch (Exception ec) {
         ec.printStackTrace();
         return null;
      }
   }

   public ArrayList<HashMap<String, String>> busApi(String depTerminalId, String arrTerminalId, String depPlandTime) throws IOException {
      ArrayList<HashMap<String, String>> al = new ArrayList<HashMap<String, String>>();

      Calendar ca = Calendar.getInstance(); // 캘린더 사용을 위해 싱글톤 생성
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      String strToday = sdf.format(ca.getTime()); // 받아온 오늘 날짜
      
      // 날짜를 선택 안할 시 에는 컴퓨터에 날짜를 받아오게 만듬
      String day = Objects.isNull(depPlandTime) || depPlandTime == "" ? strToday : depPlandTime;
      
      
      StringBuilder urlBuilder = new StringBuilder(
            "http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo"); /* URL */
      urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
            + "=Qzeq2ow4ZOJ9J7u%2F6wa4GIv7Z9sRkiSrNX%2Fc6lt7KWGd1IgAa2PRm6G2mYraUGbhcSUAtbNnLLH%2F0%2FqzoZgyQQ%3D%3D");
      urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
            + URLEncoder.encode("200", "UTF-8")); /* 한 페이지 결과 수 */
      urlBuilder.append(
            "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
      urlBuilder.append("&" + URLEncoder.encode("depTerminalId", "UTF-8") + "="
            + URLEncoder.encode(depTerminalId, "UTF-8")); /* 출발터미널 */
      urlBuilder.append("&" + URLEncoder.encode("arrTerminalId", "UTF-8") + "="
            + URLEncoder.encode(arrTerminalId, "UTF-8")); /* 도착터미널 */
      urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
            + URLEncoder.encode(day, "UTF-8")); /* 날짜 */

      URL url;
      url = new URL(urlBuilder.toString());

      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Content-type", "application/json");
      // System.out.println("Response code: " + conn.getResponseCode()); //200 - 정상
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

      try {
         String urls = url.toString();
         DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
         Document doc = dBuilder.parse(urls);

         doc.getDocumentElement().normalize();
         NodeList nlist = doc.getElementsByTagName("item");
         // System.out.println("파싱할 리스트 수:" + nlist.getLength()); //받아온 리스트의 length
         Node ndoe = null;
         
         for (int i = 0; i < nlist.getLength(); i++) {
            ndoe = nlist.item(i);
            if (ndoe.getNodeType() == Node.ELEMENT_NODE) {
               HashMap<String, String> hm = new HashMap<String, String>();
               Element eElement = (Element) ndoe;
                  String searchdephm = (getTagValue("depPlandTime", eElement)).substring(8,12); // 편집할 출발시간
                  String searcharrhm = (getTagValue("arrPlandTime", eElement)).substring(8,12); // 편집할 도착시간
                        
                  hm.put("day", day);
                  hm.put("depPlaceNm", getTagValue("depPlaceNm", eElement));
                  hm.put("arrPlaceNm", getTagValue("arrPlaceNm", eElement));
                  hm.put("depPlandTime", searchdephm);
                  hm.put("arrPlandTime", searcharrhm);
                  hm.put("charge", getTagValue("charge", eElement));
                  hm.put("gradeNm", getTagValue("gradeNm", eElement));
                  hm.put("routeId", getTagValue("routeId", eElement));

               al.add(hm);
            }
         }
      } catch (Exception ce) {
         ce.printStackTrace();
      }

      return al;
   }
}