package global.sesoc.teamBOB4.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Follow;

public interface CustomerMapper {

	int following(Follow follow);

	int checkfollow(Follow follow);

	void unfollowing(Follow follow);

	List<Integer> getFollowers(int follow_number);

	Customer searchOne(Customer customer);

	List<Integer> getFollowings(int cust_number);
	
	public int signup(Customer customer);

	public Customer selectOne(Customer customer);
	
	public Customer selectEmail(Customer customer);

	public List<Customer> getAllList();

	int deleteCustomer(Customer customer);
	
	int updateCustomer(Customer customer);

	int changePwd(Customer customer);

	Customer getNumber(int cust_number);

	List<Customer> searchList(Customer customer);

	List<Customer> searchpf(String search);

	int alter_userKey(String cust_id, String cust_key);

	int GetKey(Map<String, Object> map);

	Customer getDataFromDBsendData(String sendData);

	Customer searchOne_ByCustnumber_getProfile(int cust_number);

	int get_cust_number_by_nickname(String cust_nickname);

	Customer getNumber1(int cust_number);

}
