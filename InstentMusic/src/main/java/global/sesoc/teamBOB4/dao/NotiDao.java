package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.vo.Notification2;

@Repository
public class NotiDao {
	@Autowired
	SqlSession session;

	public void save_new_noti(Notification2 noti) {
		NotiMapper mapper = session.getMapper(NotiMapper.class);
		mapper.save_new_noti(noti);
		
	}

	public List<Notification2> getnewnotisBycust_number(int cust_number) {
		NotiMapper mapper = session.getMapper(NotiMapper.class);
		return mapper.getnewnotisBycust_number(cust_number);
	}


}
