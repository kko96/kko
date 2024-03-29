package kr.co.ziziza.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminMemberVO;

public interface AdminMembaerDAO {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminMemberVO> selectList(Map<String, Object> params);

	AdminMemberVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminMemberVO vo);

	int updateInfo(AdminMemberVO vo);

	int deleteInfo(Map<String, Object> params);

}//interface end