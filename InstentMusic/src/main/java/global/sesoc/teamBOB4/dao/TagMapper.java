package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Post;

public interface TagMapper {

	int selectTagLink(String tag_name);

	int creatTagLink(String tag_name);



}
