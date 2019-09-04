package kr.co.ziziza.main.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinDAO joinDAO;
	@Override
	public int joinIDCheck(MemberVO vo) {
		int cnt=0;
		cnt=joinDAO.joinIDCheck(vo);
		return cnt;
	}
	@Transactional(value = "transactionManager"
			, propagation = Propagation.REQUIRED
			, rollbackFor = Exception.class)

	@Override
	public int joinIns(MemberVO vo) {
		int successCnt=0;
		successCnt=joinDAO.joinIns(vo);
		return successCnt;
	}

}
