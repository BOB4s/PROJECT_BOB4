package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Like_click;
import global.sesoc.teamBOB4.vo.Post;
import global.sesoc.teamBOB4.vo.SearchWord;

public interface PostMapper {

	List<Post> getAll(int cust_number);

	public List<Post> listAll(Map<String, Object> map);

	int post_save_method(Post post);

	int getOneByMus_number(Post post);

	List<Post> getPostAll();
	
	List<Post> myList(int cust_number);

	Post getPostByPostNum(int post_number);

	List<SearchWord> searchPost(String search_word);

	List<Post> postList(String search_word);
	
	int insertWord(String search_word);

	SearchWord searchcheck(String search_word);

	void down_like_in_post(int post_number);

	void up_like_in_post(int post_number);

	List<Post> getPostAllbyliked();

	void unliked(Like_click like_click);

	void newliked(Like_click like_click);

	int checkLike_click(Like_click like_click);
	
	int updateHit(String search_word);
}
