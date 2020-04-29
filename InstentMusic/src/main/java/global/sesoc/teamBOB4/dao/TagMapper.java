package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Tag;

public interface TagMapper {

	int inserttag(Tag tag);

	Tag selectTag(Tag tag);

	String getTag(int tag_number);
}
