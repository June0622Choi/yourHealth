package kr.co.dong.user;

public interface UserDAO {
	
	UserVO login(String email, String password);
	UserVO selectOne(int users_id);
	int insert(UserVO user);
	int update(UserVO user);
	int delete(int users_id);
}