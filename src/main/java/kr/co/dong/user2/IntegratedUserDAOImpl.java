package kr.co.dong.user2;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IntegratedUserDAOImpl implements IntegratedUserDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public IntegratedUserVO login(String username, String password) {
		Map<String, String> params = new HashMap<>();
		params.put("username", username);
		params.put("password", password);
		return sqlSession.selectOne("kr.co.dong.user2.IntegratedUserMapper.login", params);
	}

	@Override
	public IntegratedUserVO selectOne(int userId) {
		return sqlSession.selectOne("kr.co.dong.user2.IntegratedUserMapper.selectOne", userId);
	}

	@Override
	public int insert(IntegratedUserVO user) {
		return sqlSession.insert("kr.co.dong.user2.IntegratedUserMapper.insert", user);
	}

	@Override
	public int update(IntegratedUserVO user) {
		return sqlSession.update("kr.co.dong.user2.IntegratedUserMapper.update", user);
	}

	@Override
	public int delete(int userId) {
		return sqlSession.delete("kr.co.dong.user2.IntegratedUserMapper.delete", userId);
	}

	@Override
	public int checkUsername(String username) {
		return sqlSession.selectOne("kr.co.dong.user2.IntegratedUserMapper.checkUsername", username);
	}
}