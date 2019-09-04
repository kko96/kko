package kr.co.ziziza.manager.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





/**
 * MemberService Interface
 * @author Park
 * @version 19-07-09
 */

@Service
public class MngCompanyListServiceImpl implements MngCompanyListService{
	
	@Autowired
	private MngCompanyDAO dao;
	
	@Override
	public List<MngRegistVO> selectRegistList(MngRegistVO vo) {
		List<MngRegistVO> list = null;
		list = dao.selectRegistList(vo);
		return list;
	}//selectCompanyList()

	@Override
	public MngRegistVO selectDetail(MngRegistVO vo) {
		vo = dao.selectDetail(vo);
		return vo;
	}//selectDetail()
	
	@Override
	public MngRegistVO selectDetailCharge(MngRegistVO vo) {
		vo = dao.selectDetailCharge(vo);
		return vo;
	}//selectDetailCharge()
	
	@Override
	public int companyInsert(MngRegistVO vo) {
		int count = 0;
		count = dao.companyInsert(vo);
		return count;
	}//companyInsert
	
	@Override
	public int companyCharge(MngRegistVO vo) {
		int count = 0;
		count = dao.companyCharge(vo);
		return count;
	}//companyCharge
	
	@Override
	public int companyPlant(MngRegistVO vo) {
		int count = 0;
		count = dao.companyPlant(vo);
		return count;
	}//companyPlant
	
	@Override
	public int deleteCompany(MngRegistVO vo) {
		int count = 0;
		count = dao.deleteCompany(vo);
		return count;
	}//deleteCompany
	
	@Override
	public int deleteCharge(MngRegistVO vo) {
		int count = 0;
		count = dao.deleteCharge(vo);
		return count;
	}//deleteCompany
	
	@Override
	public int deletePlants(MngRegistVO vo) {
		int count = 0;
		count = dao.deletePlants(vo);
		return count;
	}//deleteCompany
	
	@Override
	public MngRegistVO selectModify(MngRegistVO vo) {
		vo = dao.selectModify(vo);
		return vo;
	}//selectDetail()
	
	@Override
	public MngRegistVO selectModifyCharge(MngRegistVO vo) {
		vo = dao.selectModifyCharge(vo);
		return vo;
	}//selectDetailCharge()
	
	@Override
	public int companyUpdate(MngRegistVO vo) {
		int count = 0;
		count = dao.companyUpdate(vo);
		return count;
	}//companyUpdate
	
	@Override
	public int chargeUpdate(MngRegistVO vo) {
		int count = 0;
		count = dao.chargeUpdate(vo);
		return count;
	}//companyUpdate
	
	@Override
	public int plantUpdate(MngRegistVO vo) {
		int count = 0;
		count = dao.plantUpdate(vo);
		return count;
	}//companyUpdate
}//class end