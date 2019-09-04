package kr.co.ziziza.main.join;

import org.springframework.stereotype.Service;
@Service
public interface JoinDAO {

	public int joinIDCheck(MemberVO vo);
	
	public int joinIns(MemberVO vo);

}
