package kr.co.ziziza.common.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.common.vo.UserVO;


@Service
public class LoginService {

	@Autowired
	private LoginDAO dao;
	
	public UserVO selectUser(UserVO loginInfo) {
		return dao.selectUser(loginInfo);
	}//selectUser()

	
	
}//class end