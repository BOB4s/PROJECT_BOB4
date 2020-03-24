package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Post;

public interface PostMapper {

	List<Post> getAll(int cust_number);

}
