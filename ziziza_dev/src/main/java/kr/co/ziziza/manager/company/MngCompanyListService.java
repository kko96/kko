package kr.co.ziziza.manager.company;

import java.util.List;

public interface MngCompanyListService {
	List<MngRegistVO> selectRegistList(MngRegistVO vo);

	int companyInsert(MngRegistVO vo);

	int companyCharge(MngRegistVO vo);

	int companyPlant(MngRegistVO vo);

	MngRegistVO selectDetail(MngRegistVO vo);

	MngRegistVO selectDetailCharge(MngRegistVO vo);

	int deleteCompany(MngRegistVO vo);

	int deleteCharge(MngRegistVO vo);

	int deletePlants(MngRegistVO vo);

	MngRegistVO selectModify(MngRegistVO vo);

	MngRegistVO selectModifyCharge(MngRegistVO vo);

	int companyUpdate(MngRegistVO vo);

	int chargeUpdate(MngRegistVO vo);

	int plantUpdate(MngRegistVO vo);
}
