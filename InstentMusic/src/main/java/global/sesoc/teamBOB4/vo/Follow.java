package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Follow {

	private int fol_number; // 팔로우테이블 시퀀스 pk
	private int follower_number; //팔로우를 신청한 회원의 회원번호 FK
	private int follow_number; // 팔로우를 당한 회원의 회원번호 FK
}
