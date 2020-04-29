package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Like_click;
import global.sesoc.teamBOB4.vo.Post;

public interface PostMapper {

	List<Post> getAll(int cust_number);

	public List<Post> listAll(Map<String, Object> map);

	int post_save_method(Post post);

	int getOneByMus_number(Post post);

	List<Post> getPostAll();

	Post getPostByPostNum(int post_number);

	void update_click(Like_click like_click);

	int checkLike_click(Like_click like_click);

	void newliked(Like_click like_click);

	void unliked(Like_click like_click);

	List<Post> getPostAllbyliked();

	void up_like_in_post(int post_number);

	void down_like_in_post(int post_number);


}
