package global.sesoc.teamBOB4.dao;

import java.util.HashMap;
import java.util.List;

import global.sesoc.teamBOB4.vo.Reply;


public interface ReplyMapper {
	public int replyWrite(Reply reply);

	public List<Reply> replylist(int post_number); // 댓글 삭제 
	public int deleteReply(HashMap map);

	public int modifyReply(Reply reply);

	public int getReplyAmmout(int i);

}
