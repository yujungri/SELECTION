package study.spring.selection.dao;

import java.sql.Date;
import java.util.Map;

import study.spring.selection.model.User;

public interface UserDao {

	/** 회원가입 */
	public void register(User user) throws Exception;

	/** 아이디 중복 체크 */
	public int idCheck(User user) throws Exception;

	/** 로그인 */
	public User login(User user) throws Exception;

	/** 비밀번호 체크 */
	public int checkPW(User user) throws Exception;

	/** 탈퇴 */
	public void userDelete(User user) throws Exception;

	/** 정보수정 */
	public void userUpdate(User user) throws Exception;

	/** 아이디 찾기 */
	public User findID(User user) throws Exception;

	/** 아이디찾기 이메일 존재여부 체크 */
	public int emailCheck(User user) throws Exception;

	/** 비밀번호 찾기 */
	public String getPw(Map<String, Object> paramMap);

	/** 비밀번호 찾기 회원정보 존재여부 체크 */
	public int pwCheck(User user) throws Exception;

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String user_id, String sessionId, Date next);

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public User checkUserSessionKey(String sessionId);

}