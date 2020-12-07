package study.spring.selection.service;

import java.sql.Date;
import java.util.Map;


import study.spring.selection.model.User;

public interface UserService {
	public void register(User user) throws Exception;

	public User login(User user) throws Exception;

	public void userDelete(User user) throws Exception;

	public void userUpdate(User user) throws Exception;

	public int idCheck(User user) throws Exception;

	public int checkPW(User user) throws Exception;

	public User findID(User user) throws Exception;

	public int emailCheck(User user) throws Exception;

	public String getPw(Map<String, Object> paramMap);

	public int pwCheck(User user) throws Exception;

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String user_id, String sessionId, Date next);

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public User checkUserSessionKey(String sessionId);
}