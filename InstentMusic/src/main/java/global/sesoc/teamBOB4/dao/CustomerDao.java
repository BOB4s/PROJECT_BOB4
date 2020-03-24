package global.sesoc.teamBOB4.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Customer;
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

	public List<Integer> getFollowers(int follow_number) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		List<Integer> tempList = null;
		tempList= mapper.getFollowers(follow_number);
		return tempList;
	}

	public Customer searchOne(String cust_nickname) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return  mapper.searchOne(cust_nickname);
		
	}

	public List<Integer> getFollowings(int custId) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		List<Integer> tempList = null;
		tempList= mapper.getFollowings(custId);
		return tempList;
	}

}
