package kr.co.ziziza.manager.info;


import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller	
public class MngInfoController {
	@Autowired
	MngInfoService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MngInfoController.class);
		
		@RequestMapping(value="/manager/company/info" ,method=RequestMethod.GET)
		public String info(Model model, MngMemberInfoVO vo, MngManagerInfoVO vo2) {
			logger.info("info");
			vo = service.selectInfoMember(vo);
			model.addAttribute("MemberVO", vo);
			vo2 = service.selectInfoManager(vo2);
			model.addAttribute("ManagerVO", vo2);
			return "manager/info/info_form";
		}//info 
		
		@RequestMapping(value="/manager/company/infoModify" ,method=RequestMethod.GET)
		public String modify(Model model, MngMemberInfoVO vo, MngManagerInfoVO vo2) {
			logger.info("modify");
			vo = service.selectModifyMember(vo);
			model.addAttribute("MemberVO", vo);
			vo2 = service.selectModifyManager(vo2);
			model.addAttribute("ManagerVO", vo2);
			return "manager/info/info_modify_form";
		}//modify
		
		@RequestMapping(value ="/manager/company/infoUpdate", method =RequestMethod.POST)
		public void infoUpdate(MngMemberInfoVO vo, MngManagerInfoVO vo2, PrintWriter out) {
			logger.info("infoUpdate");
			int count = 0;
			vo.setMemberNo(vo.getMemberNo());
			count = service.memberUpdate(vo);
			count = service.managerUpdate(vo2);
			out.print(count);
			out.flush();
			out.close();
		}
}
