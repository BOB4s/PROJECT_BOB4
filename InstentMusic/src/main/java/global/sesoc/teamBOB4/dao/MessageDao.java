package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Message;

@Repository
public class MessageDao {

	@Autowired
	SqlSession session;

	public int savedMessage(Message mstemp) {
		
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		return mapper.savedMessage(mstemp);
		
	}

	public List<Message> getChatedAll(int messangerRoom) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.getChatedAll(messangerRoom);
	}




}
