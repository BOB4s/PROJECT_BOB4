package global.sesoc.teamBOB4.dao;


import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.Post_tag;

@Repository
public class Post_tagDao {

	@Autowired
	SqlSession session;

	public int following(Follow follow) {
	
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.following(follow);
		
	}


	public void linkedTags(int post_number, int tag_number) {
		Post_tagMapper mapper= session.getMapper(Post_tagMapper.class);
		Post_tag temp =new Post_tag();
		temp.setPost_number(post_number);
		temp.setTag_number(tag_number);
		mapper.linkedTags(temp);
		
	}


	public List<Integer> GetlinkedTags(int post_number) {
		Post_tagMapper mapper= session.getMapper(Post_tagMapper.class);
		List<Integer> tagList = new ArrayList<>();
		tagList= mapper.GetlinkedTags(post_number);
		return tagList;
	}

	
}
