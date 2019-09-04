package kr.co.ziziza.manager.company;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("MngRegistVO")
public class MngRegistVO {
	private	int		companyNo;		//사업장고유번호
	private String	companyKind;	//사업장종류('찜질방' '사우나' '목욕탕')
	private String 	companyName;	//상호명
	private String	address;		//소재지
	private String 	companyTel;		//전화번호
	private String 	contents;		//사업장소개글
	private String	openTime;		//영업시작시간
	private String	closeTime;		//영업마감시간
	private String 	registDate;		//등록일
	private char 	state;			//상태('Y'등록 'N'미등록)
	private String 	managerId;		//사업자고유번호
	private String 	timeKind;		//주/야간('주간' '야간')
	private String	subject;		//대상자
	private int		price;			//가격
	private String	etcContent;		//비고
	private String 	plantName;		//시설명
	private MultipartFile imgChumbu;
	private int		mngNo;			//사업자번호
	
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public String getCompanyKind() {
		return companyKind;
	}
	public void setCompanyKind(String companyKind) {
		this.companyKind = companyKind;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getTimeKind() {
		return timeKind;
	}
	public void setTimeKind(String timeKind) {
		this.timeKind = timeKind;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEtcContent() {
		return etcContent;
	}
	public void setEtcContent(String etcContent) {
		this.etcContent = etcContent;
	}
	public String getPlantName() {
		return plantName;
	}
	public void setPlantName(String plantName) {
		this.plantName = plantName;
	}
	public int getMngNo() {
		return mngNo;
	}
	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}
	public MultipartFile getImgChumbu() {
		return imgChumbu;
	}
	public void setImgChumbu(MultipartFile imgChumbu) {
		this.imgChumbu = imgChumbu;
	}
}
