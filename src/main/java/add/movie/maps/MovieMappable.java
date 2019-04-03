package add.movie.maps;

import java.util.ArrayList;
import java.util.HashMap;

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
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_select();
		
	// 영화 선택 후 영화관
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_RATING, MV_IMG, C_NAME FROM MV_V_S WHERE MV_TITLE_KR = #{mv_title_kr} GROUP BY MV_CODE, MV_TITLE_KR, MV_IMG, RT_RATING, C_NAME")
	public ArrayList<HashMap<String, String>> tc(String mv_title_kr);
	
	// 영화관 선택 후 영화
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S WHERE C_NAME=#{c_name} GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_sel(String c_name);
	
	//영화 영화관 선택 후 비교
	@Select("SELECT MV_CODE, MV_TITLE_KR, RT_IMG FROM MV_V_S WHERE C_NAME=#{c_name} AND MV_TITLE_KR = #{mv_name} GROUP BY MV_CODE, MV_TITLE_KR, RT_IMG")
	public ArrayList<HashMap<String, String>> mv_c_sel(HashMap<String, String> map);
	
	// 영화, 영화관, 날짜 선택 시
	@Select("SELECT MV_CODE, MV_TITLE_KR, TT_NAME, SD_DAY, T_TIME FROM MV_V_S WHERE MV_TITLE_KR = #{mv_title_kr} AND C_NAME=#{c_name} AND SD_DAY = #{sd_day} GROUP BY MV_CODE, MV_TITLE_KR, TT_NAME, SD_DAY, T_TIME ORDER BY TT_NAME ASC")
	public ArrayList<HashMap<String, String>> time(HashMap<String, String> map);
	
	// 영화 스케쥴 코드 조회
	@Select("SELECT SD_CODE FROM MV_V_S WHERE MV_TITLE_KR = #{mv_title_kr} AND C_NAME=#{c_name} AND SD_DAY = #{sd_day, jdbcType = INTEGER} AND T_TIME = #{t_time}")
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
	@Insert(value = "{CALL MV_P_RE(#{u_id}, #{sd_code}, #{r_price}, #{s_name})}")
	@Options(statementType = StatementType.CALLABLE)
	public void re(HashMap<String, String> m);
}
