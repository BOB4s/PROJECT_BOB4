package global.sesoc.teamBOB4.dao;

import java.util.List;
import global.sesoc.teamBOB4.vo.Music_library;
import global.sesoc.teamBOB4.vo.Part_music;
import global.sesoc.teamBOB4.vo.Temp;

public interface MakeMapper {

	int inserttemp(Temp temp);

	Temp gettemp(Temp temp);

	int updatetemp(Temp temp);

	int deltemp(Temp temp);

	int sendpart(Part_music parts);

	List<Part_music> getparts(Part_music parts);

	List<Part_music> getall(Part_music parts);

	int delparts(Part_music parts);

	int uploadtemp(Temp temp);

	int savemusic(Music_library music);

	int delphrase(Part_music parts);

	int delpartone(Part_music parts);
}
