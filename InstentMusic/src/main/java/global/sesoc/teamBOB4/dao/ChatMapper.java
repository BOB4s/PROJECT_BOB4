package global.sesoc.teamBOB4.dao;


import java.util.List;

import global.sesoc.teamBOB4.vo.MessageList;

public interface ChatMapper {

	int createChatRoom(MessageList newList);

	List<MessageList> getUsersChatRoom(String cust_nickname);

	int selectmessangerRoom(MessageList newList);

	int selectmessangerRoomDouble(MessageList newList);

	void setRecentMessage(MessageList msList);

	List<MessageList> getOppsChatRoom(String cust_nickname);

	String getOppsName(MessageList msList);

	MessageList getUsersByNumber(MessageList msList);



}
