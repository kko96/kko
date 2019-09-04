package kr.co.ziziza.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.vo.FileVO;

@Controller
@RequestMapping("/file/*")
public class FileController {
	
	@Autowired
	private FileService service;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody String deletefile(@RequestParam Map<String, Object> params) {
		int no = params.get("no") == null ? 0 : Integer.parseInt((String) params.get("no"));
		int success = 0;
		FileVO vo = service.selectInfo(no);
		if(vo != null) {
			params.put("target", "file");
			success = service.deleteInfo(params);
			if(success > 0)	fileUtil.fileDelete(vo);
		}//
		return String.valueOf(success);
	}//fileDelete()
	
	@RequestMapping(value = "imageView", method = RequestMethod.GET)
	public void imageView(@RequestParam Map<String, Object> params, HttpServletResponse response) {
		int no = params.get("no") == null ? 0 : Integer.parseInt((String) params.get("no"));
		FileVO vo = service.selectInfo(no);
		if(vo != null) {
		    try {
		    	File  file = fileUtil.getThumnail(vo);
		    	response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getOriginName(),"UTF-8")+"\";");
		    	response.setContentType(vo.getFileContentType());
		    	InputStream in = new FileInputStream(file);
				IOUtils.copy(in, response.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}//imageView()
	
}//class end