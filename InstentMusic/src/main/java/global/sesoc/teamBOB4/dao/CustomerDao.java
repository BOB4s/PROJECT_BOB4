package global.sesoc.teamBOB4.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;

@Repository
public class CustomerDao {

	@Autowired
	SqlSession session;

	public int following(Follow follow) {
	
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.following(follow);
		
	}

	public int checkfollow(Follow follow) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.checkfollow(follow);
	}

	public void unfollowing(Follow follow) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		 mapper.unfollowing(follow);
	}

}
