package kr.co.ziziza.manager.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class MngCompanyDAOImpl implements MngCompanyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MngRegistVO> selectRegistList(MngRegistVO vo) {
		List<MngRegistVO> list = null;
		list = sqlSession.selectList("CompanyListMngMapper.selectCompanyList", vo);
		return list;
	}//selectMemberList()
	
	@Override
	public MngRegistVO selectDetail(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyListMngMapper.selectDetail", vo);
		return vo;
	}//selectDetail()
	
	@Override
	public MngRegistVO selectDetailCharge(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyListMngMapper.selectDetailCharge", vo);
		return vo;
	}//selectDetailCharge()

	@Override
	public MngRegistVO selectModify(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyListMngMapper.selectDetail", vo);
		return vo;
	}//selectModify()
	
	@Override
	public MngRegistVO selectModifyCharge(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyListMngMapper.selectDetailCharge", vo);
		return vo;
	}//selectModifyCharge()
	
	@Override
	public int companyInsert(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyInsert", vo);
		return count;
	}
	@Override
	public int companyCharge(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyCharge", vo);
		return count;
	}
	@Override
	public int companyPlant(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyPlant", vo);
		return count;
	}
	@Override
	public int deleteCompany(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.delete("CompanyListMngMapper.companyDelete", vo);
		return count;
	}//deleteCompany
	@Override
	public int deleteCharge(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.delete("CompanyListMngMapper.chargeDelete", vo);
		return count;
	}//deleteCompany
	@Override
	public int deletePlants(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.delete("CompanyListMngMapper.plantsDelete", vo);
		return count;
	}//deleteCompany
	
	@Override
	public int companyUpdate(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.update("CompanyListMngMapper.companyUpdate", vo);
		return count;
	}
	
	@Override
	public int chargeUpdate(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.update("CompanyListMngMapper.chargeUpdate", vo);
		return count;
	}
	
	@Override
	public int plantUpdate(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.update("CompanyListMngMapper.plantUpdate", vo);
		return count;
	}
}
