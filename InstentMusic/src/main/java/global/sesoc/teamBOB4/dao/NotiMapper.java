package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Notification2;

public interface NotiMapper {

	void save_new_noti(Notification2 noti);

	List<Notification2> getnewnotisBycust_number(int cust_number);

	
}
