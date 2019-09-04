package kr.co.ziziza.common.file;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.common.vo.FileVO;

@Repository
public class FileDAO {

	@Autowired
	private SqlSession session;
	
	public List<FileVO> selectList(Map<String, Object> params) {
		return session.selectList("FileMapper.selectList", params);
	}//selectList()
	
	public FileVO selectInfo(int no) {
		return session.selectOne("FileMapper.selectInfo", no);
	}//selectInfo()
	
	public int insertInfo(List<FileVO> list) {
		return session.insert("FileMapper.insertInfo", list);
	}//insertInfo()
	
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("FileMapper.deleteInfo", params);
	}//deleteFileInfo()
	
}//class end