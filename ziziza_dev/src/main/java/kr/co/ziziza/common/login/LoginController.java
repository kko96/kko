package kr.co.ziziza.common.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.common.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	
	/**
	 * Login Page		로그인 페이지 이동
	 * @param			
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mainSignIn() {
		return "main/login/login";
	}//signIn()
	
	/**
	 * Login Page		로그인 페이지 이동
	 * @param			
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/login", method = RequestMethod.GET)
	public String signIn(@PathVariable String role) {
		return role + "/login/login";
	}//signIn()
	
	/**
	 * Login Process		로그인 처리
	 * @param		loginId	아이디, 	loginPw	비밀번호
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> loginProc(@PathVariable String role, UserVO loginInfo, HttpSession session) {
		Map<String, Object> params = new HashMap<String, Object>();
		if(role.equals("main")) role = "user";
		UserVO loginUser = service.selectUser(loginInfo);
		boolean result = false;
		String returnURL = "/";
		String message = "로그인 오류!!!!!!";
		if(loginUser != null) {
			if(!loginUser.getRoleName().equals(role.toUpperCase())){
				message = "로그인 권한이 없습니다.";
			}else if(loginInfo.getUserPw().equals(loginUser.getUserPw())){
				loginUser.setUserPw("");
				session.setAttribute("loginUser", loginUser);
				result = true;
				message = "로그인 성공!!!!!!";
				if(role.equals("user"))	returnURL = "/main";
				else if(role.equals("manager")) returnURL = "/manager/main";
				else if(role.equals("admin")) returnURL = "/admin/main";
			}else{
				message = "비밀번호가 일치하지 않습니다.";
			}//if end
		}else {
			message = "아이디가 존재하지 않습니다.";
		}//if end
		params.put("result", result);
		params.put("returnURL", returnURL);
		params.put("message", message);
		return params;
	}//loginProc()
	
	/**
	 * LogOut Process		로그아웃 처리
	 * @param		
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/logout")
	public String loginProc(@PathVariable String role, HttpSession session) {
		session.invalidate();
		return "redirect:/" + role + "/login";
	}//
	
}//class end