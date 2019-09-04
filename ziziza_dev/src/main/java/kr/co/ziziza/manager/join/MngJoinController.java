package kr.co.ziziza.manager.join;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MngJoinController {
	
	@Autowired
	MngJoinService service;	
	
	private static final Logger logger = LoggerFactory.getLogger(MngJoinController.class);
	
	@RequestMapping(value="/manager/company/join" ,method=RequestMethod.GET)
	public String join() {
		logger.info("join");
		return "manager/join/join_form";
	}//join
	
	@RequestMapping(value="/manager/company/joinInsert" ,method=RequestMethod.POST)
	public void joinInsert(MngMemberJoinVO vo, MngManagerJoinVO vo2, PrintWriter out) {
		logger.info("joinInsert");
		int count = 0;
		count = service.joinMember(vo);
		vo2.setMemberNo(vo.getMemberNo());
		count = service.joinManager(vo2);
		out.print(count);
		out.flush();
		out.close();
	}//joinInsert
	
	@RequestMapping(value = "/manager/company/joinIdChk", method = RequestMethod.POST)
	public void joinIdCheck(MngMemberJoinVO vo, PrintWriter out) throws IOException {
		logger.info("id Check");
		int count = 0;
		count = service.joinIdCheck(vo);
		out.print(count);
		out.flush();
		out.close();
	}//joinIdCheck
}//
