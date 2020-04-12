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
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		int res = mapper.createChatRoom(newList);
		return res;
	}

	public List<MessageList> getUsersChatRoom(String cust_nickname) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		List<MessageList> userList = null;
		List<MessageList> tempList = null;
		userList = mapper.getUsersChatRoom(cust_nickname);
		tempList = mapper.getOppsChatRoom(cust_nickname);
		for (MessageList temps : tempList)
			userList.add(temps);
		return userList;
	}

	public int selectmessangerRoom(MessageList newList) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		int messangerRoom = 0;

		messangerRoom = mapper.selectmessangerRoom(newList);
		if (messangerRoom == 0) {
			messangerRoom = mapper.selectmessangerRoomDouble(newList);
		}
		return messangerRoom;
	}

	public void setRecentMessage(MessageList msList) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		mapper.setRecentMessage(msList);

	}

	public String getOppsName(MessageList msList) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		MessageList tempList = mapper.getUsersByNumber(msList);
		if (msList.getUserName().equals(tempList.getUserName()))
			return tempList.getOpponentName();
		if (msList.getUserName().equals(tempList.getOpponentName()))
			return tempList.getUserName();
		return "";

	}

}
