package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Music_library;

public interface ListMapper {

	List<Music_library> getmusics(Music_library music);

	Music_library getmusic(Music_library music);
}
