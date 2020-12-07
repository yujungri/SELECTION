package study.spring.selection.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import study.spring.selection.dao.UserDao;
import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.User;
import study.spring.selection.service.UserService;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	UserDao dao;

	@Override
	public void register(User user) throws Exception {
		dao.register(user);
	}

	@Override
	public User login(User user) throws Exception {

		return dao.login(user);
	}

	@Override
	public void userDelete(User user) throws Exception {
		dao.userDelete(user);
	}

	@Override
	public void userUpdate(User user) throws Exception {
		dao.userUpdate(user);
	}

	@Override
	public int idCheck(User user) throws Exception {
		int result = dao.idCheck(user);
		return result;
	}

	@Override
	public User findID(User user) throws Exception {

		return dao.findID(user);
	}

	@Override
	public int emailCheck(User user) throws Exception {
		int result = dao.emailCheck(user);
		return result;
	}

	@Override
	public String getPw(Map<String, Object> paramMap) {

			return dao.getPw(paramMap);
	}

	@Override
	public int pwCheck(User user) throws Exception {
		int result = dao.pwCheck(user);
		return result;
	}

	/** 탈퇴 시 비밀번호 재확인 */
	@Override
	public int checkPW(User user) throws Exception {
		int result = dao.checkPW(user);
		return result;
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) {

		dao.keepLogin(user_id, sessionId, next);
	}

	@Override
	public User checkUserSessionKey(String sessionId) {

		return dao.checkUserSessionKey(sessionId);
	}
}