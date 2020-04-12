package global.sesoc.teamBOB4.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.Post;

@Repository
public class TagDao {

	@Autowired
	SqlSession session;

	public int selectTagLink(String tag_name) {
		TagMapper mapper =session.getMapper(TagMapper.class);
	 int resultLink=0;
	 resultLink =mapper.selectTagLink(tag_name);
	 if(resultLink==0) {
		mapper.creatTagLink(tag_name);
		resultLink =mapper.selectTagLink(tag_name);
	 }
		return resultLink;
	}

	
}
