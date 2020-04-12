package global.sesoc.teamBOB4.dao;


import java.util.List;

import global.sesoc.teamBOB4.vo.MessageList;

public interface ChatMapper {

	int createChatRoom(MessageList newList);

	List<MessageList> getUsersChatRoom(String username);
	
	List<MessageList> getUsersChatRoom2(String username);

	int selectmessangerRoom(MessageList newList);

	MessageList selectMesRoom(int messangerRoom);

	int selectmessangerRoom2(MessageList newList);




}
