package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Reply {

	private int rep_number; // 리플 시퀀스 pk
	private int post_number; // 댓글 달린 게시물 FK
	private int cust_number; // 댓글 단 회원의 FK
	private String rep_content; // 리플 내용
	private String rep_nickname; // 리플 단 회원 닉네임
	private String rep_url; // 리플 단 회원의 프로필 url 주소
	private String rep_date; // 리플 단 시간
}
