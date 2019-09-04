package kr.co.ziziza.main.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.BoardVO;


@Repository
public class noticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<BoardVO> list() {
		List<BoardVO> list =null;
		list = sqlSession.selectList("NoticeMapper.noticelist");
		return list;
	}

	public BoardVO detail(BoardVO vo) {
		vo = sqlSession.selectOne("NoticeMapper.noticedetail", vo);
		return vo;
	}

}
