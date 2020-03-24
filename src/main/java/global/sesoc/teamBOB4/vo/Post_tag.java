package global.sesoc.teamBOB4.vo;

import lombok.Data;

@Data
public class Post_tag {

	private int pt_number; // 포스트-태그 시퀀스 pk
	private int tag_number; // 태그 fk
	private int post_number; // 게시물 fk
}
