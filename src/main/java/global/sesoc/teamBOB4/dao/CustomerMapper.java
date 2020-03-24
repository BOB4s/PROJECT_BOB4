package global.sesoc.teamBOB4.dao;

import global.sesoc.teamBOB4.vo.Follow;

public interface CustomerMapper {

	int following(Follow follow);

	int checkfollow(Follow follow);

	void unfollowing(Follow follow);


}
