package global.sesoc.teamBOB4.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.Post;

@Repository
public class PostDao {

	@Autowired
	SqlSession session;

	public int following(Follow follow) {
	
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.following(follow);
		
	}

	public List<Post> getAll(int cust_number) {
		PostMapper mapper =session.getMapper(PostMapper.class);
		List<Post> tempList = mapper.getAll(cust_number);
		return tempList;
	}
}
