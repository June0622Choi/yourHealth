package kr.co.dong.login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.dong.user.UserDAO;
import kr.co.dong.user.UserVO;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(String email, String password) {
		return userDAO.login(email, password);
	}
	
	@Override
	public UserVO selectOne(int users_id) {
		return userDAO.selectOne(users_id);
	}
	
	@Override
	public int insert(UserVO user) {
		return userDAO.insert(user);
	}
	
	@Override
	public int update(UserVO user) {
		return userDAO.update(user);
	}
	
	@Override
	public int delete(int users_id) {
		return userDAO.delete(users_id);
	}
}