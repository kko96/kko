package kr.co.ziziza.main.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAOImpl implements JoinDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public int joinIDCheck(MemberVO vo) {
		int cnt=0;
		cnt=sqlSession.selectOne("JoinMapper.joinIDChk", vo);
		return cnt;
	}

	@Override
	public int joinIns(MemberVO vo) {
		int successCnt=0;
		successCnt=sqlSession.insert("JoinMapper.joinIns", vo);
		return successCnt;
	}

}
