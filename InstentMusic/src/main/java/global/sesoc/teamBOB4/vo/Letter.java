package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Letter {

	private int let_number; // 쪽지 시퀀스 pk
	private int send_number; // 보낸 회원 번호 FK
	private int recv_number; // 받은 회원 번호 FK
	private String let_title; // 쪽지 제목(혹은 목록에 보이는 채팅내용)
	private String let_content; // 쪽지 내용(혹은 채팅 내용)
	private int recv_check; // 받은 사람 읽음 여부. 디폴트 0. 읽으면 1.
	private String let_date; // 발송 일시
}
