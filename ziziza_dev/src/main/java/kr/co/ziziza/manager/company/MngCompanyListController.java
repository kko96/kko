package kr.co.ziziza.manager.company;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class MngCompanyListController {
	
	@Autowired
	MngCompanyListService service;	
	
	private static final Logger logger = LoggerFactory.getLogger(MngCompanyListController.class);
	
	@RequestMapping(value="/manager/company/list" ,method=RequestMethod.GET)
	public String list(Model model, MngRegistVO vo) {
		logger.info("list");
		List<MngRegistVO> list = service.selectRegistList(vo);
		model.addAttribute("list", list);
		return "manager/list/list_form";
	}//list
	
	@RequestMapping(value="/manager/company/regist" ,method=RequestMethod.GET)
	public String regist() {
		logger.info("regist");
		return "manager/list/regist_form";
	}//regist

	@RequestMapping(value="/manager/company/detail" ,method=RequestMethod.GET)
	public String detail(Model model, MngRegistVO vo) {
		logger.info("detail");
		vo = service.selectDetail(vo);
		model.addAttribute("detailVO", vo);
		vo = service.selectDetailCharge(vo);
		model.addAttribute("detailChargeVO", vo);
		return "manager/list/detail_form";
	}//detail
	
	@RequestMapping(value="/manager/company/modify" ,method=RequestMethod.GET)
	public String modify(Model model, MngRegistVO vo) {
		logger.info("modify");
		vo = service.selectModify(vo);
		model.addAttribute("detailVO", vo);
		vo = service.selectModifyCharge(vo);
		model.addAttribute("detailChargeVO", vo);
		return "manager/list/modify_form";
	}//modify
	
	@RequestMapping(value="/manager/company/insert" ,method=RequestMethod.POST)
	public void companyInsert(MngRegistVO vo, PrintWriter out) {
		logger.info("companyInsert");
		int count = 0;
		count = service.companyInsert(vo);
		vo.setCompanyNo(vo.getCompanyNo());
		count = service.companyCharge(vo);
		count = service.companyPlant(vo);
		out.print(count);
		out.flush();
		out.close();
	}//companyInsert
	
	@RequestMapping(value="/manager/company/delete",method=RequestMethod.GET)
	public void boardDelete(MngRegistVO vo, PrintWriter out) {
		int count = 0; 
		count = service.deleteCompany(vo);
		count = service.deleteCharge(vo);
		count = service.deletePlants(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
	
	
//	@RequestMapping(value ="/mng/company/fileUp", method =RequestMethod.POST)
//	public String fileUp(MultipartRequest multipartRequest) throws IOException {
//		logger.info("fileUp");
//		Iterator<String> iter = multipartRequest.getFileNames();
//		MultipartFile file = null;
//		InputStream in = null;
//		OutputStream out = null;
//		String ofnm = "", sfnm = "";
//		while(iter.hasNext()) {
//			file = multipartRequest.getFile(iter.next());
//			ofnm = file.getOriginalFilename();
//			sfnm = service.makeSaveFileName(ofnm);
//			in = file.getInputStream();
//			out = new FileOutputStream("C:\\filetest\\"+sfnm);
//			FileCopyUtils.copy(in, out);
//		}//while
//		return "redirect:/mng/company/list";
//	}
}//
