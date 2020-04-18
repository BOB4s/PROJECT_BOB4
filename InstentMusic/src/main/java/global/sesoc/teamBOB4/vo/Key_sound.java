package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Key_sound {

	private int key_number; // 키보드 시퀀스 pk
	private int cust_number; // 키보드 사용 회원 세션
	private String key_board; // 키보드 이름
	private String sou_path; // 소리 저장 경로
	private String sou_name; // 키보드에 매칭된 사운드 이름
	private String key_name; // 사운드가 매칭된 키 이름(자판 키)
}
