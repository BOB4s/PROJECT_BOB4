package global.sesoc.teamBOB4.dao;

public interface TagMapper {

	int selectTagLink(String tag_name);

	int creatTagLink(String tag_name);

	String selectTagnameByTagnum(int tag_number);



}
