package global.sesoc.teamBOB4.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamBOB4.dao.CustomerMapper;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Follow;

@Repository
public class CustomerDao {

	@Autowired
	SqlSession session;

	public int following(Follow follow) {
	
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.following(follow);
		
	}

	public int checkfollow(Follow follow) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return mapper.checkfollow(follow);
	}

	public void unfollowing(Follow follow) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		 mapper.unfollowing(follow);
	}

	public List<Integer> getFollowers(int follow_number) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		List<Integer> tempList = null;
		tempList= mapper.getFollowers(follow_number);
		return tempList;
	}

	public Customer searchOne(String cust_nickname) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		return  mapper.searchOne(cust_nickname);
		
	}

	public List<Integer> getFollowings(int cust_number) {
		CustomerMapper mapper= session.getMapper(CustomerMapper.class);
		List<Integer> tempList = null;
		tempList= mapper.getFollowings(cust_number);
		return tempList;
	}
	
	public int signup(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		int result = mapper.signup(customer);
		
		System.out.println(result);
		return result;
	}

	public Customer selectOne(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		return mapper.selectOne(customer);
	}
	public Customer selectEmail(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		return mapper.selectEmail(customer);
	}

	public String getDataFromDBsendData(String sendData) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer c =mapper.searchOne(sendData);
		
		String reciver ="";
		
			if(c!=null) {
				reciver= c.getCust_nickname();
			}
		return reciver;
	}
	
	public int withdrawal(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		int result = mapper.deleteCustomer(customer);
		
		return result; 
	}
	public int updateCustomer(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		int result = mapper.updateCustomer(customer);
		
		return result; 
	}

	public int changePwd(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		int result = mapper.changePwd(customer);
		
		return result;
	}
	public Customer getNumber(int cust_number) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		return mapper.getNumber(cust_number);
	}
	
	public List<Customer> searchList(Customer customer){
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		List<Customer>list = mapper.searchList(customer);
		
		return list;
	}

	public List<Customer> searchpf(String search) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		return mapper.searchpf(search);
	}
}
