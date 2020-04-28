package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Temp {

	private int temp_number; // 작곡중인 음악 시퀀스 pk
	private int cust_number; // 작곡중인 회원 세션
	private String temp_title;
	private int temp_bpm;
	private String temp_saved;
	private String fullPath;
}
