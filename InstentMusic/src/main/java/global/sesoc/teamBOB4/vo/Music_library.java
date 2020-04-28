package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Music_library {

	private int mus_number; // 음악 시퀀스 pk
	private int cust_number; // 음악 작곡한 회원 세션
	private String mus_title; // 음악 제목(파일 오리지널 이름)
	private String mus_saved; // 음악 파일 저장 이름
	private String mus_date; // 음악 작곡한 일시
	private String fullPath;
}
