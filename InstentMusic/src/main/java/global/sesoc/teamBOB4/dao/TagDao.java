package global.sesoc.teamBOB4.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Tag;

@Repository
public class TagDao {

	@Autowired
	SqlSession session;

	public int inserttag(Tag tag) {
		TagMapper mapper =session.getMapper(TagMapper.class);
		return mapper.inserttag(tag);
	}

	public Tag selectTag(Tag tag) {
		TagMapper mapper =session.getMapper(TagMapper.class);
		return mapper.selectTag(tag);
	}

}
