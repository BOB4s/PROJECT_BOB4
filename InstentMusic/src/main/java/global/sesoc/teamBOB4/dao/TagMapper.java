package global.sesoc.teamBOB4.dao;

import global.sesoc.teamBOB4.vo.Tag;

public interface TagMapper {

	int inserttag(Tag tag);

	Tag selectTag(Tag tag);

	String selectTagnameByTagnum(int tag_number);
}
