package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Key_sound;
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

	public List<Sound_library> getSounds(Sound_library sound) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.getSounds(sound);
	}

	public int editlib(Map<String, Object> map) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.editlib(map);
	}

	public int deletelib(Sound_library sound) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.deletelib(sound);
	}

	public List<Sound_library> searchsound(Map<String, Object> map) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.searchsound(map);
	}

	public List<Sound_library> getorigin(Sound_library added) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.getorigin(added);
	}

	public int insertkey(Key_sound keys) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.insertkey(keys);
	}

	public List<Key_sound> getkeys(Key_sound keys) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.getkeys(keys);
	}

	public int delkey(Key_sound keys) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.delkey(keys);
	}

	public int updatekey(Key_sound keys) {
		MusicMapper mapper = session.getMapper(MusicMapper.class);
		return mapper.updatekey(keys);
	}
}
