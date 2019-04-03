package add.maps;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface TestMappable {
	/* xml 방식 */
	// 회원 리스트
	public ArrayList<HashMap<String, String>> selectTest();
	
	/* 어노테이션 방식 */
	// 회원가입
	@Insert("INSERT INTO MEMBER VALUES (member_SEQ.NEXTVAL, #{f_id}, #{userPw}, #{f_name}, #{f_email}, #{female}, #{f_age}, #{f_ph})")
	public void join(HashMap<String, String> m);
	
	@Select("SELECT M_ID FROM MEMBER WHERE M_ID = #{id}")
	public HashMap<String, Object> selectID(@Param("id") String id);
	
	// 아이디 중복 체크 
	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_ID = #{f_id}")
	public HashMap<String, String> id_Check(@Param("f_id") String f_id);
	
	// 아이디 중복확인
	@Select("SELECT M_ID FROM MEMBER")
	public ArrayList<HashMap<String, String>> idcheck();
	
	// 아이디
	@Select("SELECT M_ID FROM MEMBER WHERE M_ID = #{userId}")
	public String idSearch(@Param("userId") String userId);
	
	//회원코드 가져오기
	@Select("SELECT M_NUM FROM MEMBER WHERE M_ID = #{userId}")
	public String M_code(@Param("userId") String userId);
	
	//회원 성별 가져오기
	@Select("SELECT M_GENDER FROM MEMBER WHERE M_ID = #{userId}")
	public String M_gender(@Param("userId") String userId);
	
	// 패스워드
	@Select("SELECT M_PWD FROM MEMBER WHERE M_ID = #{userId} and M_PWD = #{userPw}")
	public String pwdSearch(@Param("userId") String userId, @Param("userPw") String userPw);
	
	@Insert("INSERT INTO MEMBER(m_num, m_id, m_email) VALUES (member_SEQ.NEXTVAL, #{id}, #{email})")
	public void insertLogin(HashMap<String, Object> m);
}
