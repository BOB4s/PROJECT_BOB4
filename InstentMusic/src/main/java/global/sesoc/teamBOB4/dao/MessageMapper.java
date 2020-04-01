package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Message;

public interface MessageMapper {

	int savedMessage(Message mstemp);

	List<Message> getChatedAll(int messangerRoom);



}
