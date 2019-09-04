package kr.co.ziziza.main.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.manager.company.MngRegistVO;

@Repository
public class CompanyDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<MngRegistVO> list() {
		List<MngRegistVO> list = null;
		list = sqlSession.selectList("CompanyMapper.companylist");
		return list;
	}

	public MngRegistVO detail(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyMapper.companydetail", vo);
		return vo;
	}

	public List<ReplyVO> companyreply(MngRegistVO vo) {
		List<ReplyVO> list = null;
		list = sqlSession.selectList("CompanyMapper.companyreplylist", vo);
		return list;
	}

	public int insertreply(ReviewVO vo) {
		int successCnt = 0;
		successCnt = sqlSession.insert("CompanyMapper.companyinsertReply",vo);
		return successCnt;
	}

	public ReviewVO replyDetail(ReviewVO vo) {
		vo = sqlSession.selectOne("CompanyMapper.companyReplyDetail", vo);
		return vo;
	}

}
