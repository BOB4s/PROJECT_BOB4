package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Customer {

	private int cust_number; // 회원 시퀀스 pk
	private String cust_id; // 회원 로그인 아이디
	private String cust_password; // 회원 로그인 비밀번호
	private String cust_email; // 회원 이메일(인증, 비밀번호 찾기 등)
	private String cust_nickname; // 회원 닉네임(사이트 내에서 사용할 이름)
	private String cust_introduce; // 회원 소개 (프로필 자기소개)
	private String cust_photo_original; // 프로필 사진 원래 이름
	private String cust_photo_saved; // 프로필 사진 저장 이름
	private String cust_key; // 이메일 인증시 등록할 키
	
}
