package global.sesoc.teamBOB4.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		return mapper.following(follow);

	}

	public List<Post> getAll(int cust_number) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		List<Post> tempList = mapper.getAll(cust_number);
		return tempList;
	}

	public List<Post> postList(String searchItem, String searchWord) {
		PostMapper mapper = session.getMapper(PostMapper.class);

		Map<String, Object> map = new HashMap<>();

		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		List<Post> postList = mapper.listAll(map);

		return postList;
	}

	public int post_save_method(Post post) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.post_save_method(post);
	}

	public int getOneByMus_number(Post post) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.getOneByMus_number(post);
	}

	public List<Post> getPostAll(List<Integer> follwedList) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		List<Post> tempList = new ArrayList<>();
		/* Map <String, List<Post>> resultMap = new HashMap<>(); */
		tempList = mapper.getPostAll();
		return tempList;
		/*
		 * List<Post> resultList = new ArrayList<>(); for (Post post : tempList) { for
		 * (int cust_number : follwedList) { if (post.getCust_number() == cust_number)
		 * resultList.add(post); } } return resultList;
		 */
		
		/*
		 * for (Post post:tempList) { if(post.getPost_nickname().contains(searchWord)) {
		 * List<Post> MapsList = resultMap.get("nickname"); if(MapsList != null) {
		 * MapsList.add(post); resultMap.put("nickname", MapsList); }else { List<Post>
		 * tempLists = new ArrayList<>(); tempLists.add(post); resultMap.put("nickname",
		 * tempLists); }
		 * 
		 * 
		 * } if(post.getPost_content().contains(searchWord)){ List<Post> MapsList =
		 * resultMap.get("content"); if(MapsList != null) { MapsList.add(post);
		 * resultMap.put("content", MapsList); }else { List<Post> tempLists = new
		 * ArrayList<>(); tempLists.add(post); resultMap.put("content", tempLists); } }
		 * if(post.getMus_title().contains(searchWord)) { List<Post> MapsList =
		 * resultMap.get("title"); if(MapsList != null) { MapsList.add(post);
		 * resultMap.put("title", MapsList); }else { List<Post> tempLists = new
		 * ArrayList<>(); tempLists.add(post); resultMap.put("title", tempLists); } }
		 * 
		 * }
		 */

	
	}

	public Post getPostByPostNum(int post_number) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.getPostByPostNum(post_number);
	}

}
