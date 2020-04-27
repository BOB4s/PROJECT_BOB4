package global.sesoc.teamBOB4.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TagDao {

	@Autowired
	SqlSession session;

	public int selectTagLink(String text) {
		String tag_name =  text;
		TagMapper mapper =session.getMapper(TagMapper.class);
	 int resultLink=0;
	 resultLink =mapper.selectTagLink(tag_name);
	 if(resultLink==0) {
		mapper.creatTagLink(tag_name);
		resultLink =mapper.selectTagLink(tag_name);
	 }
		return resultLink;
	}

	public String selectTagnameByTagnum(int tag_number) {
		TagMapper mapper =session.getMapper(TagMapper.class);
		return mapper.selectTagnameByTagnum(tag_number);
	}

	
}
