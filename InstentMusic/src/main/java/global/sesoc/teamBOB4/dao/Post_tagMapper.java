package global.sesoc.teamBOB4.dao;

import java.util.List;
import global.sesoc.teamBOB4.vo.Post_tag;

public interface Post_tagMapper {

	void linkedTags(Post_tag post_tag);

	List<Integer> GetlinkedTags(int post_number);



}
