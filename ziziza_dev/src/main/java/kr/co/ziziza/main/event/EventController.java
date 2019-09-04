package kr.co.ziziza.main.event;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.main.board.BoardVO;




@Controller
public class EventController {
	
	@Autowired
	EventService eventService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	
	@RequestMapping(value="/event/list",method=RequestMethod.GET)
	private String list(Model model) {
		logger.info("list");
		List<BoardVO> list = null;
		list = eventService.list();
		model.addAttribute("list", list);
		return "main/event/list";
	}
	
	@RequestMapping(value="/event/detail",method=RequestMethod.GET)
	private String detail(BoardVO vo, Model model) {
		logger.info("detail");
		vo = eventService.detail(vo);
		model.addAttribute("detailVO", vo);
		return "main/event/detail";
	}
}
