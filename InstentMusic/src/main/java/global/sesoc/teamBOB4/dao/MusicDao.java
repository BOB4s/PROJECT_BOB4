package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Sound_library;

@Repository
public class MusicDao {

	@Autowired
	SqlSession session;

	public List<Sound_library> getSoundlib(int cust_number) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.getSoundlib(cust_number);
	}

	public int insertSound(Sound_library sound) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.insertSound(sound);
	}
}
