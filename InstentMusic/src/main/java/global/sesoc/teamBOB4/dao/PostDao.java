package global.sesoc.teamBOB4.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.Like_click;
import global.sesoc.teamBOB4.vo.Post;
import global.sesoc.teamBOB4.vo.SearchWord;

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
	
	public List<Post> myList(int cust_number){
		PostMapper mapper = session.getMapper(PostMapper.class);
		List<Post> result = mapper.myList(cust_number);
		
		return result;
	}

	  public List<Post> getPostAll(List<Integer> follwedList) {
	      PostMapper mapper = session.getMapper(PostMapper.class);
	      List<Post> tempList = new ArrayList<>();
	      /* Map <String, List<Post>> resultMap = new HashMap<>(); */
	      tempList = mapper.getPostAll();
	      List<Post> resultList = new ArrayList<>();
	      for (Post post : tempList) {
	         for (int cust_number : follwedList) {
	            if (post.getCust_number() == cust_number)
	               resultList.add(post);
	         }
	      }
	      return resultList;

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

	public List<SearchWord> searchPost(String search_word) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		List<SearchWord>list = mapper.searchPost(search_word);
		return list;
	}

	public List<Post> postList(String search_word) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		List<Post> result = mapper.postList(search_word);
		return result;
	}

	public int insertWord(String search_word) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		
		return mapper.insertWord(search_word);
	}

	public SearchWord searchcheck(String search_word) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		SearchWord list = mapper.searchcheck(search_word);
		return list;
	}

	public int checkLike_click(Like_click like_click) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.checkLike_click(like_click);
	}

	public void newliked(Like_click like_click) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		 mapper.newliked(like_click);
	}

	public void unliked(Like_click like_click) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		 mapper.unliked(like_click);
		
	}

	public List<Post> getPostAllbyall() {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.getPostAll();
	}

	public List<Post> getPostAllbyliked() {
		PostMapper mapper = session.getMapper(PostMapper.class);
		return mapper.getPostAllbyliked();
	}

	public void up_like_in_post(int post_number) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		 mapper.up_like_in_post(post_number);
	}

	public void down_like_in_post(int post_number) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		 mapper.down_like_in_post(post_number);
	}

	public int hitcount(String search_word) {
		PostMapper mapper = session.getMapper(PostMapper.class);
		
		return mapper.updateHit(search_word);
	}
}
