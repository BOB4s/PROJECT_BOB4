package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Sound_library;

public interface MusicMapper {

	List<Sound_library> getSoundlib(int cust_number);

	int insertSound(Sound_library sound);

}
