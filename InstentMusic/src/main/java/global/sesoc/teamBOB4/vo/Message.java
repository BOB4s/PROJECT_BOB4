package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Message {

	private int Mes_number; // 쪽지 시퀀스 pk
	private String cust_nickname; // 보낸 회원 번호 FK
	private String Mes_content; // 쪽지 내용(혹은 채팅 내용)
	private String Mes_File;
	private int mes_checked;   // 혹시 봤어?
	private String mes_date; // 발송 일시
	private int messangerRoom; //룸넘버
	private String mes_savefile;
	
}
