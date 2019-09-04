package kr.co.ziziza.main.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.BoardVO;

@Repository
public class eventDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<BoardVO> list() {
		List<BoardVO> list = null;
		list = sqlSession.selectList("EventMapper.eventlist");
		return list;
	}

	public BoardVO detail(BoardVO vo) {
		vo = sqlSession.selectOne("EventMapper.eventdetail", vo);
		return vo;
	}

}
