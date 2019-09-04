package kr.co.ziziza.main.company;

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
import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.manager.company.MngRegistVO;




@Controller
public class CompanyController {
	
	@Autowired
	CompanyService companyService;
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	@RequestMapping(value="/zlzlza",method=RequestMethod.GET)
	private String list(Model model, MngRegistVO vo) {
		logger.info("list");
		List<MngRegistVO> list = null;
		list = companyService.list();
		model.addAttribute("list", list);
		return "main/zlzlza/list";
	}
	
	@RequestMapping(value="/zlzlza/detail",method=RequestMethod.GET)
	private String detail(MngRegistVO vo, Model model) {
		logger.info("detail");
		vo = companyService.detail(vo);
		model.addAttribute("detailVO", vo);
		
		List<ReplyVO> list = companyService.companyReplyList(vo);
		model.addAttribute("reply_list", list);
		return "main/zlzlza/detail";
	}
	@RequestMapping(value="/zlzlza/repInsert",method=RequestMethod.POST)
	private void repinsert(ReviewVO vo, Model model, PrintWriter out, HttpSession session) {
		logger.info("=== repinsert ===");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		vo.setMember_no(7);//
		count = companyService.insertcompanyReply(vo);
		if(count > 0) {
			vo = companyService.companyReplyDetail(vo);
			JSONArray arr = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("company_no", vo.getCompany_no());
			obj.put("review_no", vo.getReview_no());
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
	
}
