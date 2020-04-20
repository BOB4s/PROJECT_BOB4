package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Key_sound;
import global.sesoc.teamBOB4.vo.Sound_library;
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
}
