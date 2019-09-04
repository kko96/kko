package kr.co.ziziza.main.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.main.board.BoardVO;


@Service
public class NoticeService {

	@Autowired
	noticeDAO dao;
	
	public List<BoardVO> list() {
		List<BoardVO> list = null;
		list = dao.list();
		return list;
	}

	public BoardVO detail(BoardVO vo) {
		vo = dao.detail(vo);
		return vo;
	}
}
