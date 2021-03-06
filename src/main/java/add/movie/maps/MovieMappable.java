package add.movie.maps;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.StatementType;

public interface MovieMappable {
	
	// 영화 등록
	@Select("SELECT MV_F_MV(#{rnum}, #{title_kr}, #{title_en}, #{story}, #{poster}, #{odt}, #{rating}, #{st}, #{sg}, #{ct}) FROM DUAL")
	public String mv_insert(HashMap<String, String> dtm);
	
	// 감독 등록
	@Insert(value = "{CALL MV_P_DL(#{mv_c}, #{dt})}")
	@Options(statementType = StatementType.CALLABLE)
	public void dt_insert(@Param(value = "mv_c") int mv_c, @Param(value = "dt") String dt);
	
	// 배우 등록
	@Insert(value = "{CALL MV_P_AL(#{mv_c}, #{at})}")
	@Options(statementType = StatementType.CALLABLE)
	public void at_insert(@Param(value = "mv_c") int mv_c, @Param(value = "at") String at);
	
	// 장르 등록
	@Insert(value = "{CALL MV_P_GL(#{mv_c}, #{gr})}")
	@Options(statementType = StatementType.CALLABLE)
	public void gr_insert(@Param(value = "mv_c") int mv_c, @Param(value = "gr") String gr);
	
	// 영화 순위 초기화
	@Update("UPDATE MV_MOVIE SET MV_RNUM = 0")
	public void mv_update();
	
	// 영화 순위 리스트
	@Select("SELECT * FROM MV_V_MV WHERE MV_RNUM > 0 ORDER BY MV_RNUM ASC")
	public ArrayList<HashMap<String, String>> boxList();
	
	// 영화 리스트
	@Select("SELECT * FROM MV_V_MV_R WHERE F_PAGIN(R, #{pnum, jdbcType=INTEGER}, 5) = 1")
	public ArrayList<HashMap<String, String>> movie_list(int pnum);
	
	// 영화 상세 정보
	@Select("SELECT * FROM MV_V_MV WHERE MV_CODE = #{mv_code}")
	public HashMap<String, String> mv_dt_sel(HashMap<String, String> m);
	
	// 상영관 확인
	@Select("SELECT MV_F_TT(#{c_code}, #{tt_name}, #{d_start, jdbcType=INTEGER}, #{d_end, jdbcType=INTEGER}) FROM DUAL")
	public int tt_sel(HashMap<String, String> m);
	
	// 상영 영화 등록
	@Insert(value = "{CALL MV_P_S(#{movie_num}, #{c_code}, #{tt_name}, #{sd_day}, #{t_time})}")
	@Options(statementType = StatementType.CALLABLE)
	public void mv_in(HashMap<String, String> m);
	
	// 개봉 영화 리스트
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S WHERE SD_DAY >= #{today, jdbcType=INTEGER} GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_select(String today);
		
	// 영화 선택 후 영화관
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_RATING, MV_IMG, C_NAME FROM MV_V_S WHERE MV_TITLE_KR = #{mv_title_kr} AND SD_DAY >= #{today, jdbcType=INTEGER} GROUP BY MV_CODE, MV_TITLE_KR, MV_IMG, RT_RATING, C_NAME")
	public ArrayList<HashMap<String, String>> tc(HashMap<String, String> mv_title_kr);
	
	// 영화관 선택 후 영화
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S WHERE C_NAME=#{c_name} AND SD_DAY >= #{today, jdbcType=INTEGER} GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_sel(HashMap<String, String> c_name);
	
	//영화 영화관 선택 후 비교
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S WHERE C_NAME=#{c_name} AND MV_TITLE_KR = #{mv_title_kr} AND SD_DAY >= #{today, jdbcType=INTEGER} GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_c_sel(HashMap<String, String> map);
	
	// 영화, 영화관, 날짜 선택 시
	@Select("SELECT MV_CODE, MV_TITLE_KR, TT_NAME, SD_DAY, T_TIME, TT_SEAT, CS FROM MV_V_SC_ALL WHERE MV_TITLE_KR = #{mv_title_kr} AND C_NAME=#{c_name} AND SD_DAY = #{sd_day} GROUP BY MV_CODE, MV_TITLE_KR, TT_NAME, SD_DAY, T_TIME, CS, TT_SEAT ORDER BY TT_NAME ASC")
	public ArrayList<HashMap<String, String>> time(HashMap<String, String> map);
	
	// 영화 스케쥴 코드 조회
	@Select("SELECT SD_CODE FROM MV_V_S WHERE MV_TITLE_KR = #{mv_title_kr} AND C_NAME=#{c_name} AND TT_NAME = #{tt_name} AND SD_DAY = #{sd_day, jdbcType = INTEGER} AND T_TIME = #{t_time}")
	public String SDC(HashMap<String, String> map);
	
	// 스케쥴 조회
	@Select("SELECT * FROM MV_V_S WHERE SD_CODE = #{sd_code, jdbcType = INTEGER}")
	public HashMap<String, String> sd(@Param(value="sd_code") String sd_code);
	
	// 예매 된 좌석
	@Select("SELECT MV_CODE, MV_TITLE_KR, C_NAME, TT_NAME, SD_DAY, T_TIME, S_NAME FROM MV_V_RE WHERE SD_CODE = #{sd_code, jdbcType = INTEGER} ORDER BY S_NAME ASC")
	public ArrayList<HashMap<String, String>> seat(@Param(value="sd_code") String sd_code);
	
	// 예약된 좌석 수
	@Select("SELECT MV_F_SC(#{sd_code, jdbcType = INTEGER}) SC FROM DUAL")
	public int sc(String sd_code);
	
	// 예매
	@Insert(value = "{CALL MV_P_RE(#{u_id}, #{sd_code, jdbcType = INTEGER}, #{r_price, jdbcType = INTEGER}, #{s_name})}")
	@Options(statementType = StatementType.CALLABLE)
	public void re(HashMap<String, String> m);
	
	// 영화 페이징
	@Select("SELECT * FROM MV_PAGE_MOVIE")
	public HashMap<String, Integer> mv_page();
	
	// 전체 예약 페이징
	@Select("SELECT * FROM MV_PAGE_RE_ALL")
	public HashMap<String, Integer> re_all_page();
	
	// 전체 예약 페이징
	@Select("SELECT COUNT(*) ct, CEIL(COUNT(*)/15) CC FROM MV_RESERVE WHERE M_NUM = #{m_num, jdbcType = INTEGER}")
	public HashMap<String, Integer> re_page(@Param("m_num") String m_num);
	
	// 회원리스트 페이징
	@Select("SELECT * FROM MV_PAGE_MEMBER")
	public HashMap<String, Integer> m_page();
	
	// 회원 리스트
	@Select("SELECT * FROM V_R_M WHERE F_PAGIN(R, 1, 15) = 1")
	public ArrayList<HashMap<String, String>> m_list(); 
	
	// 회원 번호 찾기
	@Select("SELECT M_NUM FROM MEMBER WHERE M_ID = #{user}")
	public String userId(@Param("user") String user);
	
	// 예약내역
	@Select("SELECT * FROM (SELECT ROWNUM R, SG.* FROM (SELECT * FROM MV_V_S_G WHERE M_ID = #{user, jdbcType = VARCHAR} ORDER BY R_CODE DESC) SG) S WHERE F_PAGIN(R, #{pnum, jdbcType = INTEGER}, 15) = 1")
	public ArrayList<HashMap<String, String>> rev_l(@Param("user") String user,@Param("pnum") int pnum);
	
	// 관리자 전체 예약 내역 
	@Select("SELECT * FROM MV_V_SG_ALL WHERE F_PAGIN(R, #{pnum}, 15) = 1")
	public ArrayList<HashMap<String, String>> rev_l_all(int pnum);

	// 예약 취소
	@Insert(value = "{ CALL MV_P_C(#{r_code, jdbcType = INTEGER})}")
	@Options(statementType = StatementType.CALLABLE)
	public void r_del(@Param("r_code") String r_code);
	
	// 나이
	@Select("SELECT M_BIRTH FROM MEMBER WHERE M_ID = #{user}")
	public String age(String user);
}	
