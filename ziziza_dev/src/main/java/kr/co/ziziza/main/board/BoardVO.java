package kr.co.ziziza.main.board;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {

	private int board_no; //게시물번호
	private String title; //제목
	private String contents; //내용
	private String e_start_date; //이벤트시작일
	private String e_end_date; //이벤트종료일
	private String regist_date; //등록일
	private String modify_date; //수정일
	private String hit; //조회수
	private String report; //신고수
	private char state; //상태
	private int member_no; //회원번호
	private int modify_no;//수정번호
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getModify_no() {
		return modify_no;
	}
	public void setModify_no(int modify_no) {
		this.modify_no = modify_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getE_start_date() {
		return e_start_date;
	}
	public void setE_start_date(String e_start_date) {
		this.e_start_date = e_start_date;
	}
	public String getE_end_date() {
		return e_end_date;
	}
	public void setE_end_date(String e_end_date) {
		this.e_end_date = e_end_date;
	}
	public String getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getHit() {
		return hit;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	
}//class
