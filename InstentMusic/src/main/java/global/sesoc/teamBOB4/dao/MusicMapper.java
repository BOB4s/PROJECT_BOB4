package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Key_sound;
import global.sesoc.teamBOB4.vo.Sound_library;

public interface MusicMapper {

	List<Sound_library> getSoundlib(int cust_number);

	int insertSound(Sound_library sound);

	List<Sound_library> getSounds(Sound_library sound);

	int editlib(Map<String, Object> map);

	int deletelib(Sound_library sound);

	List<Sound_library> searchsound(Map<String, Object> map);

	List<Sound_library> getorigin(Sound_library added);

	int insertkey(Key_sound keys);

	List<Key_sound> getkeys(Key_sound keys);

	int delkey(Key_sound keys);

	int updatekey(Key_sound keys);
}
