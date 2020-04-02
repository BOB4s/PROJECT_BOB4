package global.sesoc.teamBOB4.dao;


import java.util.List;

import global.sesoc.teamBOB4.vo.MessageList;

public interface ChatMapper {

	int createChatRoom(MessageList newList);

	List<MessageList> getUsersChatRoom(String username);



}
