package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Sound_library {

	private int sou_number; // 녹음 사운드 번호 시퀀스 pk
	private int cust_number; // 녹음 사운드 라이브러리 회원 fk
	private String sou_type; // 사운드 타입(속성 폴더 이름. 피아노, 드럼, 사용자정의 이름 등)
	private String sou_name; // 사운드 이름(파일 오리지널 이름)
	private String sou_saved; // 사운드 저장 이름
	private String fullPath;
}
