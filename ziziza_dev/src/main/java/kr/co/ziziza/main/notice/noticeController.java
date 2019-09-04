package kr.co.ziziza.main.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.vo.FileVO;
import kr.co.ziziza.main.board.BoardVO;

@Controller
public class noticeController {

	
		
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	FileService fileService;
	
	private static final Logger logger = LoggerFactory.getLogger(noticeController.class);
	
	
	@RequestMapping(value="/notice/list",method=RequestMethod.GET)
	private String list(Model model) {
		logger.info("list");
		List<BoardVO> list = null;
		list = noticeService.list();
		model.addAttribute("list", list);
		return "main/notice/list";
	}
	
	@RequestMapping(value="/notice/detail",method=RequestMethod.GET)
	private String detail(Model model, BoardVO vo) {
		logger.info("detail");
		vo = noticeService.detail(vo);
		model.addAttribute("detailVO",vo);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("menuNo", vo.getBoard_no());
		params.put("menuType", "NOTICE");
		List<FileVO> files = fileService.selectList(params);
		model.addAttribute("fileList", files);
		return "main/notice/detail";
	}
	
}

