package kr.co.ziziza.main.join;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class JoinControllerImpl implements JoinController{

	private static final Logger logger=LoggerFactory.getLogger(JoinControllerImpl.class);
	
	@Autowired
	JoinService joinService;
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("==joinform==");
		return "/main/join/join";
	}
	@RequestMapping(value = "/joinidchk", method = RequestMethod.POST)
	public void joinIDCheck(MemberVO vo, PrintWriter out)
	throws IOException {
		logger.info("==joinIDCheck==");
		logger.info("==vo==");
		int cnt=0;
		cnt=joinService.joinIDCheck(vo);
		out.print(cnt);
		out.flush();
		out.close();
	}
	@RequestMapping(value = "/joinins", method = RequestMethod.POST)
	public void joinIns(MemberVO vo, PrintWriter out) {
		logger.info("==joinIns==");
		int successCnt=0;
		successCnt=joinService.joinIns(vo);
		out.print(successCnt);
		out.flush();
		out.close();
	}
	
}

