package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Music_library;

@Repository
public class ListDao {

	@Autowired
	SqlSession session;

	public List<Music_library> getmusics(Music_library music) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		return mapper.getmusics(music);
	}

	public Music_library getmusic(Music_library music) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		return mapper.getmusic(music);
	}
}
