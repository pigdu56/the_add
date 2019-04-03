package add.movie;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import add.movie.maps.MovieMappable;

@Configuration
public class Paging {
	@Autowired
	MovieMappable mm;
	
	
	// 영화 페이징 : 페이징처리
	public void moviePaging(int pnum, HttpServletRequest r) {
		// 페이지그룹의 갯수
		double gpage = 5; // 페이지 그룹의 개수
		r.setAttribute("gpage", (int) gpage);
		// 전체글의 개수
		r.setAttribute("rcounts", mm.mv_page().get("CT"));
		// 전체페이지 개수
		String epage = String.valueOf(mm.mv_page().get("CC"));
		int all_epage = Integer.parseInt(epage);
		r.setAttribute("all_epage", all_epage);
		r.setAttribute("pcounts", epage);
		// 그룹의 시작페이지번호 : pnum(현재페이지)
		// Math.floor : 소수점이하 절삭
		int group_spage = (int) Math.floor((pnum - 1) / gpage) * (int) gpage + 1;
		r.setAttribute("group_spage", group_spage);
		// 현재 페이지
		r.setAttribute("group_npage", pnum);
		// 그룹의 마지막페이지번호 :
		int group_epage = group_spage + ((int) gpage - 1);
		// 마지막그룹 처리
		group_epage = group_epage > all_epage ? all_epage : group_epage;
		r.setAttribute("group_epage", group_epage);
	}
	
	// 전체 예매 페이징 : 페이징처리
	public void reAllPaging(int pnum, HttpServletRequest r) {
		//  페이지그룹의 갯수
		double gpage = 5;  // 페이지 그룹의 개수
		r.setAttribute("gpage", (int)gpage);
		// 전체글의 개수
		r.setAttribute("rcounts", mm.re_all_page().get("CT"));
		// 전체페이지 개수	
		String epage = String.valueOf(mm.re_all_page().get("CC"));
		int all_epage = Integer.parseInt(epage);
		r.setAttribute("all_epage", all_epage);
		r.setAttribute("pcounts", epage);
		// 그룹의 시작페이지번호 : pnum(현재페이지)
		// Math.floor : 소수점이하 절삭
		int group_spage = (int)Math.floor((pnum-1)/gpage)*(int)gpage + 1;
		r.setAttribute("group_spage", group_spage);
		// 현재 페이지
		r.setAttribute("group_npage", pnum);
		// 그룹의 마지막페이지번호 : 
		int group_epage = group_spage + ((int)gpage -1);
		// 마지막그룹 처리
		group_epage =  group_epage > all_epage ?  all_epage : group_epage;
		r.setAttribute("group_epage", group_epage);
   }
		
	// 예매 페이징 : 페이징처리
	public void rePaging(String m_num, int pnum, HttpServletRequest r) {
		//  페이지그룹의 갯수
		double gpage = 5;  // 페이지 그룹의 개수
		r.setAttribute("gpage", (int)gpage);
		// 전체글의 개수
		r.setAttribute("rcounts", mm.re_page(m_num).get("CT"));
		// 전체페이지 개수	
		String epage = String.valueOf(mm.re_page(m_num).get("CC"));
		int all_epage = Integer.parseInt(epage);
		r.setAttribute("all_epage", all_epage);
		r.setAttribute("pcounts", epage);
		// 그룹의 시작페이지번호 : pnum(현재페이지)
		// Math.floor : 소수점이하 절삭
		int group_spage = (int)Math.floor((pnum-1)/gpage)*(int)gpage + 1;
		r.setAttribute("group_spage", group_spage);
		// 현재 페이지
		r.setAttribute("group_npage", pnum);
		// 그룹의 마지막페이지번호 : 
		int group_epage = group_spage + ((int)gpage -1);
		// 마지막그룹 처리
		group_epage =  group_epage > all_epage ?  all_epage : group_epage;
		r.setAttribute("group_epage", group_epage);
   }
}
