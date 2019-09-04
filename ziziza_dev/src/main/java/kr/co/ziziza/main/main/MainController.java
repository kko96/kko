package kr.co.ziziza.main.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jca.context.BootstrapContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.main.join.MemberVO;


@Controller
public class MainController {
	private static final Logger logger
	= LoggerFactory.getLogger(BootstrapContextAware.class);

	
	@RequestMapping(value= {"/", "/main"}
							,method=RequestMethod.GET)
	public String home(Model model) {
		logger.info("home");
		List<MemberVO> list = null;
		model.addAttribute("mbr_list", list);
		model.addAttribute("mbr_list", list);
		model.addAttribute("mbr_list", list);
		model.addAttribute("mbr_list", list);
		return "main/main";
	}//file1
	@RequestMapping(value="/test"
			,method=RequestMethod.GET)
	public String test(Model model) {
	logger.info("home");
	return "main/home/test";
	}//file1
}
