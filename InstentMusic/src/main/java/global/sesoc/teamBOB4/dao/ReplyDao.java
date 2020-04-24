package global.sesoc.teamBOB4.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Reply;

@Repository
public class ReplyDao {
	@Autowired
	SqlSession session;

	public int writeReply(Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		return mapper.replyWrite(reply);

	}

	public List<Reply> replyList(int post_number) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		return mapper.replylist(post_number);
	}

	public int deleteReply(int rep_number, int post_number) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("rep_number", rep_number);
		map.put("post_number", post_number);
		int result = mapper.deleteReply(map);
		return result;
	}

	public int modifyReply(Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);

		return mapper.modifyReply(reply);

	}

	public int getReplyAmmout(int post_number) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		HashMap<Integer, Integer> map = new HashMap<>();
		
			int temp = mapper.getReplyAmmout(post_number);
			

		return temp;
	}

}
