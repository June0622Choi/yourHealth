package kr.co.dong.login;

import kr.co.dong.user.UserVO;

public interface UserService {
	UserVO login(String email, String password);
	UserVO selectOne(int users_id);
	int insert(UserVO user);
	int update(UserVO user);
	int delete(int users_id);
}