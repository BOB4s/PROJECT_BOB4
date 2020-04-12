package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Sound_library;

public interface MusicMapper {

	List<Sound_library> getSoundlib(int cust_number);

	int insertSound(Sound_library sound);

	List<Sound_library> getSounds(Sound_library sound);

	int editlib(Map<String, Object> map);

	int deletelib(Sound_library sound);

}
