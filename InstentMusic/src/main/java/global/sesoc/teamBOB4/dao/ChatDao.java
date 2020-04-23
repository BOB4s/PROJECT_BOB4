package global.sesoc.teamBOB4.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.MessageList;

@Repository
public class ChatDao {

	@Autowired
	SqlSession session;

	public int createChatRoom(MessageList newList) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		int res = mapper.createChatRoom(newList);
		return res;
	}

	public List<MessageList> getUsersChatRoom(String username) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		List<MessageList> userList= null;
		 userList= mapper.getUsersChatRoom(username);
		 
		return userList;
	}

	public int selectmessangerRoom(MessageList newList) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		int messangerRoom = mapper.selectmessangerRoom(newList);
		return messangerRoom;
	}

	public MessageList selectMesRoom(int messangerRoom) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		return  mapper.selectMesRoom(messangerRoom);
		
	}

	public List<MessageList> getUsersChatRoom2(String username) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		List<MessageList> userList= null;
		 userList= mapper.getUsersChatRoom2(username);
		 
		return userList;
	}

	public int selectmessangerRoom2(MessageList newList) {
		ChatMapper mapper =session.getMapper(ChatMapper.class);
		int messangerRoom = mapper.selectmessangerRoom2(newList);
		return messangerRoom;
	}

	

}
