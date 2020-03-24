package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Notification {

	private int not_number; // 알림 테이블 시퀀스 PK
	private int recv_number; // 알림 받는 회원의 회원번호 FK
	private int send_number; // 알림이 생기는 행위를 한 회원의 회원번호 FK
	private int fol_number; // 알림에 해당하는 팔로우 번호 FK
	private int let_number; // 알림에 해당하는 쪽지 번호 FK
	private int rep_number; // 알림에 해당하는 댓글 번호 FK
	private int like_number; // 알림에 해당하는 좋아요 번호 FK
	private String not_type; // 알림 타입 (팔로우, 쪽지, 댓글, 좋아요)
	private String not_url; // 알림을 클릭할 때 넘어갈 알림이 발생한 곳의 url
	private String not_time; // 알림이 발생한 일시
	private int not_check; // 알림을 확인했는가. 디폴트 0. 확인하면 1.
}
