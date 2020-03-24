package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Like_click {

	private int like_number; // 좋아요 번호 pk
	private int cust_number; // 좋아요 누른 회원의 fk
	private int target_number; // 좋아요 받은 회원의 fk
	private int post_number; // 좋아요 누른 게시물의 fk
	private int likt_type; // 좋아요 눌렀는지. 디폴트 0. 누르면 1.
}
