package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Temp {

	private int temp_number; // 작곡중인 음악 시퀀스 pk
	private int cust_number; // 작곡중인 회원 세션
	private String temp_title; // 작곡중인 파일 제목 (불러오기용. 중복금지!)
	private int trap_number; // 트랩(구간) 번호
	private int key_number; // 트랩에서 사용중인 키보드 fk
	private String key_board; // 트랩에서 사용중인 키보드 이름
	
}
