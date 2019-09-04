package kr.co.ziziza.manager.company;

import java.util.List;

public interface MngCompanyDAO {

	public int companyInsert(MngRegistVO vo);

	public int companyCharge(MngRegistVO vo);

	public int companyPlant(MngRegistVO vo);

	public List<MngRegistVO> selectRegistList(MngRegistVO vo);
	
	public MngRegistVO selectDetail(MngRegistVO vo);

	public MngRegistVO selectDetailCharge(MngRegistVO vo);

	public int deleteCompany(MngRegistVO vo);

	public int deleteCharge(MngRegistVO vo);

	public int deletePlants(MngRegistVO vo);

	public MngRegistVO selectModify(MngRegistVO vo);

	public MngRegistVO selectModifyCharge(MngRegistVO vo);

	public int companyUpdate(MngRegistVO vo);

	public int chargeUpdate(MngRegistVO vo);

	public int plantUpdate(MngRegistVO vo);
}
