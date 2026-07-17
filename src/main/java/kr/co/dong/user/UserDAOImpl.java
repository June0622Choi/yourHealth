package kr.co.dong.user;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(String email, String password) {
		Map<String, String> params = new HashMap<>();
		params.put("email", email);
		params.put("password", password);
		return sqlSession.selectOne("kr.co.dong.user.UserMapper.login", params);
	}
	
	@Override
	public UserVO selectOne(int users_id) {
		return sqlSession.selectOne("kr.co.dong.user.UserMapper.selectOne", users_id);
	}
	
	@Override
	public int insert(UserVO user) {
		return sqlSession.insert("kr.co.dong.user.UserMapper.insert", user);
	}
	
	@Override
	public int update(UserVO user) {
		return sqlSession.update("kr.co.dong.user.UserMapper.update", user);
	}
	
	@Override
	public int delete(int users_id) {
		return sqlSession.delete("kr.co.dong.user.UserMapper.delete", users_id);
	}
}