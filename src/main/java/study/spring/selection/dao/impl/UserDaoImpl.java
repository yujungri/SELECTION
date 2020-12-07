package study.spring.selection.dao.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.selection.dao.UserDao;
import study.spring.selection.model.User;

@Service
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void register(User user) throws Exception {

		sqlSession.insert("UserMapper.register", user);
	}

	@Override
	public User login(User user) throws Exception {

		return sqlSession.selectOne("UserMapper.login", user);
	}

	@Override
	public void userDelete(User user) throws Exception {

		sqlSession.delete("UserMapper.userDelete", user);
	}

	@Override
	public void userUpdate(User user) throws Exception {

		sqlSession.update("UserMapper.userUpdate", user);
	}

	@Override
	public int idCheck(User user) throws Exception {

		int result = sqlSession.selectOne("UserMapper.idCheck", user);
		return result;
	}

	@Override
	public User findID(User user) throws Exception {

		return sqlSession.selectOne("UserMapper.findID", user);
	}

	@Override
	public int emailCheck(User user) throws Exception {
		int result = sqlSession.selectOne("UserMapper.emailCheck", user);
		return result;
	}

	@Override
	public String getPw(Map<String, Object> paramMap) {

		return sqlSession.selectOne("UserMapper.getPw", paramMap);
	}

	@Override
	public int pwCheck(User user) throws Exception {
		int result = sqlSession.selectOne("UserMapper.pwCheck", user);
		return result;
	}

	/** 비밀번호 체크 */
	@Override
	public int checkPW(User user) throws Exception {
		int result = sqlSession.selectOne("UserMapper.checkPW", user);
		return result;
	}

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	@Override
	public void keepLogin(String user_id, String sessionId, Date next) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("sessionId", sessionId);
		map.put("next", next);

		// Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
		// Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
		// 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
		sqlSession.update("UserMapper.keepLogin", map);
	}

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	@Override
	public User checkUserSessionKey(String sessionId) {
		// 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
		return sqlSession.selectOne("UserMapper.checkUserSessionKey", sessionId);
	}

}