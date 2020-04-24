package global.sesoc.teamBOB4.dao;

import java.util.List;

import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Follow;

public interface CustomerMapper {

	int following(Follow follow);

	int checkfollow(Follow follow);

	void unfollowing(Follow follow);

	List<Integer> getFollowers(int follow_number);

	Customer searchOne(String cust_nickname);

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

}
