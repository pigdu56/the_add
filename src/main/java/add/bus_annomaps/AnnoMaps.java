package add.bus_annomaps;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;
import org.springframework.web.bind.annotation.RequestParam;

public interface AnnoMaps {
	/****************** api 터미널 ******************/
	@Select("SELECT * FROM BUS_DO ORDER BY DO_CODE")
	public ArrayList<HashMap<String, String>> getApiDo();

	@Select("SELECT * FROM BUS_TERMINAL WHERE DO_CODE=#{do_code}")
	public ArrayList<HashMap<String, String>> getApoSi(String do_code);

	/****************** api 조회시 디비 인서트 ******************/

	// 경로코드 함수
	@Select("SELECT BUS_ROUTE_INSERT(#{depPlaceNm}, #{arrPlaceNm}) TER_CODE FROM DUAL")
	public HashMap<String, String> getTerCode(@Param("depPlaceNm") String depPlaceNm,
			@Param("arrPlaceNm") String arrPlaceNm);

	// 스케쥴 인서트
	@Insert("{ CALL BUS_INSERT(#{grade, mode=IN, jdbcType=VARCHAR}, #{company},"
			+ " #{routecode}, #{day}, #{depPlandTime, mode=IN, jdbcType=VARCHAR},"
			+ " #{arrPlandTime, mode=IN, jdbcType=VARCHAR}, #{charge, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType = StatementType.CALLABLE)
	public void insertSchedule(@RequestParam HashMap<String, String> m);

	// 디비에 검색한 값이 저장이 되어있는 지 체크
	@Select("SELECT COUNT(*) FROM V_BUS WHERE SCHE_DAY = #{day} "
			+ "AND ROUTE_CODE = #{routecode} ORDER BY SCHE_CODE ASC")
	public int dbCheck(@Param("day") String day, @Param("routecode") String routecode);

	// 화면에 뿌려줄 검색한 버스 스케줄 목록
	@Select("SELECT * FROM V_BUS WHERE SCHE_DAY = #{day} AND ROUTE_CODE = #{routecode} ORDER BY SCHE_CODE ASC")
	public ArrayList<HashMap<String, String>> getScheduel(@Param("day") String day,
			@Param("routecode") String routecode);

	// 버스 스케쥴 번호에 대한 좌석 넘버 array에 담음
	@Select("SELECT S.B_SEATNUM FROM BUS_BUY B, BUS_SEAT S \r\n"
			+ "WHERE B.B_CODE = S.B_CODE AND B.S_CODE = #{bus_seq}")
	public ArrayList<HashMap<String, String>> getSeatNumber(@Param("bus_seq") String bus_seq);

	// 예약 인서트
	@Insert("INSERT INTO BUS_BUY VALUES (BUS_BUY_SEQ.NEXTVAL, #{member_num}, #{bus_seq})")
	public void buyInsert(@Param("member_num") String member_num, @Param("bus_seq") String bus_seq);

	// 예약 시퀀스 가져오기
	@Select("SELECT BB.B_CODE FROM(SELECT ROWNUM R,B.B_CODE FROM\r\n" + 
				"(SELECT B_CODE FROM BUS_BUY WHERE M_NUM = #{m_num} AND S_CODE = #{s_code} ORDER BY B_CODE DESC)B)BB WHERE R=1")
		public int buySeq(@Param("m_num") String m_num, @Param("s_code") String s_code);

	// 시트 인서트
	@Insert("INSERT INTO BUS_SEAT VALUES (#{seq}, #{b_seatnum})")
	public void seatInsert(@Param("seq") String seq, @Param("b_seatnum") String b_seatnum);

	// 회원 번호 가져오기
	@Select("SELECT M_NUM FROM MEMBER WHERE M_ID = #{id}")
	public int memberNum(@Param("id") String id);

	// 예약후에 예약한 내역 가져오기
	@Select("SELECT * FROM BUY_LIST WHERE B_CODE = #{seq} ORDER BY B_SEATNUM DESC, S_CODE DESC")
	public ArrayList<HashMap<String, String>> buy_list(@Param("seq") int seq);

	// 전체 좌석 한 컬럼으로 합쳐서 나오게 하기(admin)
	@Select("SELECT * FROM MEMBER_BUY_LIST ORDER BY S_DAY DESC, S_CODE ASC")
	public ArrayList<HashMap<String, String>> admin_buy_list();

	// 선택시 그 사람 정보 티켓 뿌리기(admin)
	@Select("SELECT * FROM BUY_LIST WHERE B_CODE = #{b_code}")
	public ArrayList<HashMap<String, String>> member_buy_list(@Param("b_code") String b_code);

	// 유저 전체 구매 리스트
	@Select("SELECT * FROM MEMBER_BUY_LIST WHERE M_NUM = #{m_num} ORDER BY S_DAY DESC")
	public ArrayList<HashMap<String, String>> user_buy_list(@Param("m_num") String m_num);

	// 예매 취소
	@Insert("{ CALL BUY_CANCLE(#{b_code, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType = StatementType.CALLABLE)
	public void buy_cancle(@Param("b_code") String b_code);
	
	// 동시 접속 체크
	@Select("SELECT COUNT(*) S FROM SEAT_CHECK WHERE S_CODE=#{bus_seq} AND B_SEATNUM = #{b_seatnum}")
	public int check_seat(@Param("bus_seq") String bus_seq, @Param("b_seatnum") String b_seatnum);
}