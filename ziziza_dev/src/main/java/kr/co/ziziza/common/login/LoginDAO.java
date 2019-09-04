package kr.co.ziziza.common.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.common.vo.UserVO;


@Repository
public class LoginDAO {

	@Autowired
	private SqlSession session;
	
	public UserVO selectUser(UserVO loginInfo) {
		return session.selectOne("LoginMapper.selectUser", loginInfo);
	}//selectUser()

}//class end