package kr.co.dong.user2;

public interface IntegratedUserDAO {
	IntegratedUserVO login(String username, String password);
	IntegratedUserVO selectOne(int userId);
	int insert(IntegratedUserVO user);
	int update(IntegratedUserVO user);
	int delete(int userId);
	int checkUsername(String username); 
}