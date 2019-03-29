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
	
	// 개봉 영화 리스트
	@Select("SELECT * FROM MV_V_MV WHERE MV_RNUM > 0 ORDER BY MV_RNUM ASC")
	public ArrayList<HashMap<String, String>> mv_select();
	
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
	
}
