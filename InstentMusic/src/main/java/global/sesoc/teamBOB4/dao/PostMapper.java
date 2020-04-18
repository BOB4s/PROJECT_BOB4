package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Post;

public interface PostMapper {

	List<Post> getAll(int cust_number);

	public List<Post> listAll(Map<String, Object> map);

	int post_save_method(Post post);

	int getOneByMus_number(int mus_number);

	List<Post> getPostAll();

}
