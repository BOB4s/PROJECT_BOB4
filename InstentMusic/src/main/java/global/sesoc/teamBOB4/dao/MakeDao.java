package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Music_library;
import global.sesoc.teamBOB4.vo.Part_music;
import global.sesoc.teamBOB4.vo.Temp;

@Repository
public class MakeDao {

	@Autowired
	SqlSession session;

	public int inserttemp(Temp temp) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.inserttemp(temp);
	}

	public Temp gettemp(Temp temp) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.gettemp(temp);
	}

	public int updatetemp(Temp temp) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.updatetemp(temp);
	}

	public int deltemp(Temp temp) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.deltemp(temp);
	}

	public int sendpart(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.sendpart(parts);
	}

	public List<Part_music> getparts(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.getparts(parts);
	}

	public List<Part_music> getall(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.getall(parts);
	}

	public int delparts(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.delparts(parts);
	}

	public int uploadtemp(Temp temp) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.uploadtemp(temp);
	}

	public int savemusic(Music_library music) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.savemusic(music);
	}

	public int delphrase(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.delphrase(parts);
	}

	public int delpartone(Part_music parts) {
		MakeMapper mapper = session.getMapper(MakeMapper.class);
		return mapper.delpartone(parts);
	}
}
