package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Key_sound;
import global.sesoc.teamBOB4.vo.Part_music;
import global.sesoc.teamBOB4.vo.Sound_library;
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
}
