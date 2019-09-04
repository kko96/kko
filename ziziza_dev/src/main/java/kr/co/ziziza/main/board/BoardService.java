package kr.co.ziziza.main.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public List<BoardVO> list() {
		List<BoardVO> list = null;
		list = dao.list();
		return list;
	}

	public int insert(BoardVO vo) {
		int count = 0;
		count = dao.Insert(vo);
		return count;
	}

	public BoardVO detail(BoardVO vo) {
		vo = dao.detail(vo);
		return vo;
	}

	public int boarddelete(BoardVO vo) {
		int count = 0;
		count = dao.delete(vo);
		return count;
	}

	public int boardupdate(BoardVO vo) {
		int count = 0;
		count = dao.update(vo);
		return count;
	}
	
	public int insertBoardReply(ReplyVO vo) {
		int successCnt = 0;
		successCnt = dao.insertreply(vo);
		return successCnt;
	}
	

	public List<ReplyVO> boardReplyList(BoardVO vo) {
		List<ReplyVO> list = null;
		list = dao.reply(vo);
		return list;
	}

	public ReplyVO boardReplyDetail(ReplyVO vo) {
		vo = dao.replyDetail(vo);
		return vo;
	}

	public int deleteReply(ReplyVO vo) {
		return dao.deleteReply(vo);
		
	}

}
