package kr.co.dong.user2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.user.UserDAO;
import kr.co.dong.user.UserVO;

@Service
public class IntegratedUserServiceImpl implements IntegratedUserService {

	@Autowired
	private IntegratedUserDAO integratedUserDAO;

	@Autowired
	private UserDAO userDAO;  // users 테이블용 DAO 추가 주입

	@Override
	public IntegratedUserVO login(String username, String password) {
		return integratedUserDAO.login(username, password);
	}

	@Override
	public IntegratedUserVO selectOne(int userId) {
		return integratedUserDAO.selectOne(userId);
	}

	@Override
	public int insert(IntegratedUserVO user) {
		int result = integratedUserDAO.insert(user);

		// 통합회원가입 성공하면 users 테이블에도 같이 저장해서
		// /user/login (일반 로그인)으로도 로그인 가능하게 함
		UserVO userVO = new UserVO();
		userVO.setEmail(user.getUsername());
		userVO.setPassword(user.getPassword());
		userVO.setName(user.getNickname());
		userVO.setPhone("000-0000-0000"); // 통합가입 폼엔 전화번호가 없어서 임시값
		userVO.setRole("user");

		userDAO.insert(userVO);

		return result;
	}

	@Override
	public int update(IntegratedUserVO user) {
		return integratedUserDAO.update(user);
	}

	@Override
	public int delete(int userId) {
		return integratedUserDAO.delete(userId);
	}
	@Override
	public boolean isUsernameDuplicate(String username) {   // ← 추가
		return integratedUserDAO.checkUsername(username) > 0;
}
}	