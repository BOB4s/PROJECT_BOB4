package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Post {

	private int post_number; // 게시물 시퀀스 pk
	private int mus_number; // 게시물의 음악 fk
	private int cust_number; // 게시물 올린 회원 번호. 세션사용.
	private String mus_title; // 음악 제목(파일 오리지널 이름)
	private String post_content; // 게시물 내용(음악설명 등)
	private String post_date; // 게시물 등록 일시
	private String post_nickname;
	private int post_reply; // 게시물에 등록된 댓글 개수
	private int post_like; // 게시물에 눌러진 좋아요 수
	private int post_play; // 게시물 음악 재생 횟수
	private String post_original; // 게시물에 등록한 사진 오리지널 이름
	private String post_saved; // 게시물에 등록한 사진 저장 이름

}
