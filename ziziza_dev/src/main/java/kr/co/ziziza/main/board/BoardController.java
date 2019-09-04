package kr.co.ziziza.main.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.common.vo.UserVO;





@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping(value="/board/list",method=RequestMethod.GET)
	private String list(Model model) {
		logger.info("list");
		List<BoardVO> list = null;
		list = boardService.list();
		model.addAttribute("list", list);
		return "main/board/list";
	}
	@RequestMapping(value="/board/write",method=RequestMethod.GET)
	private String write(HttpSession session) {
		logger.info("write");
		String url = "main/board/write";
		UserVO vo = (UserVO)session.getAttribute("loginUser");
		if(vo ==null) {
			url = "main/login/login";
		}
		return url;
	}
	
	@RequestMapping(value="/board/insert",method=RequestMethod.POST)
	private void insert(HttpSession session, BoardVO vo, PrintWriter out) {
		logger.info("=== insert ===");
		int count = 0;
		count = boardService.insert(vo);
		out.print(count);
		out.flush();
		out.close();
	}//insert
	
	@RequestMapping(value="/board/detail",method=RequestMethod.GET)
	private String detail(BoardVO vo, Model model) {
		logger.info("detail");
		vo = boardService.detail(vo);
		model.addAttribute("detailVO", vo);
		
		List<ReplyVO> list = boardService.boardReplyList(vo);
		model.addAttribute("reply_list", list);
		return "main/board/detail";
	}
	@RequestMapping(value="/board/delete",method=RequestMethod.POST)
	private void delete(BoardVO vo, HttpSession session, PrintWriter out) {
		logger.info("delete");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		
		count = boardService.boarddelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}
	@RequestMapping(value="/board/modify",method=RequestMethod.GET)
	private String modify(BoardVO vo, HttpSession session, Model model, PrintWriter out) {
		logger.info("modify");
		vo = boardService.detail(vo);
		model.addAttribute("detailVO", vo);
		return "main/board/modify";
	}
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	private void update(BoardVO vo, HttpSession session, PrintWriter out) {
		logger.info("update");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		count = boardService.boardupdate(vo);
		out.print(count);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/board/repinsert",method=RequestMethod.POST)
	private void repinsert(ReplyVO vo, PrintWriter out, HttpSession session) {
		logger.info("=== repinsert ===");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		vo.setMember_no(7);//
//		vo.setMember_no(vo.getMember_no());
		count = boardService.insertBoardReply(vo);
		if(count > 0) {
			vo = boardService.boardReplyDetail(vo);
			JSONArray arr = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("board_no", vo.getBoard_no());
			obj.put("comment_no", vo.getComment_no());
			obj.put("contents", vo.getContents());
			obj.put("regist_date", vo.getRegist_date());
			obj.put("member_no", user.getUserNo());
			arr.add(obj);
			String jsonStr = arr.toString();
			out.print(jsonStr);
		} else {
			out.print(count);
		}
		out.flush();
		out.close();
	}//insert
	
	@RequestMapping(value="/board/repdelete",method=RequestMethod.POST)
	private void delete(ReplyVO vo, HttpSession session, PrintWriter out) {
		logger.info("delete");
		int count = 0;
		count = boardService.deleteReply(vo); 
		out.print(count);
		out.flush();
		out.close();
	}
}
