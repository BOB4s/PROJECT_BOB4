package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Post;
import global.sesoc.teamBOB4.vo.SearchWord;

public interface PostMapper {

	List<Post> getAll(int cust_number);

	public List<Post> listAll(Map<String, Object> map);

	int post_save_method(Post post);

	int getOneByMus_number(int mus_number);

	List<Post> getPostAll();
	
	List<Post> myList(int cust_number);

	Post getPostByPostNum(int post_number);

	List<SearchWord> searchPost(String search_word);

	List<Post> postList(String search_word);
	
	int insertWord(String search_word);

	SearchWord searchcheck(String search_word);

}
