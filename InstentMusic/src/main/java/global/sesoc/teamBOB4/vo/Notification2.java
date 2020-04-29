package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Notification2 {

	private int not_number; // 알림 테이블 시퀀스 PK
	private int not_cust_number; // 알림 받는 회원의 회원번호 FK
	private int not_sender_number;
	private String not_type; // 알림 타입 (팔로우, 쪽지, 댓글, 좋아요)
	private String not_content; // 알림을 클릭할 때 넘어갈 알림이 발생한 곳의 url
	private String not_time; // 알림이 발생한 일시
	private int not_check; // 알림을 확인했는가. 디폴트 0. 확인하면 1.
	private String not_savedData;
	private String not_nickname;
}
