package global.sesoc.teamBOB4.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.MessageList;
import global.sesoc.teamBOB4.vo.Post;

@Repository
public class ChatDao {

	@Autowired
	SqlSession session;

	public int createChatRoom(MessageList newList) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		int res = mapper.createChatRoom(newList);
		return res;
	}

	
	
	

}
