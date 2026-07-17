package kr.co.dong.user2;

public interface IntegratedUserService {
	IntegratedUserVO login(String username, String password);
	IntegratedUserVO selectOne(int userId);
	int insert(IntegratedUserVO user);
	int update(IntegratedUserVO user);
	int delete(int userId);
	boolean isUsernameDuplicate(String username);
}