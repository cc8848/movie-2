package movie.dao;

import javax.annotation.Resource;

import movie.bean.User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 用户类DAO
 * 实现了用户的增加与获取功能
 * @author 杨赟
 */
@Repository
public class UserDAO extends HibernateDaoSupport{
	/**
	 * 添加用户方法
	 * @param user 要添加的用户
	 */
	public void add(User user){
		user.setId(1);
		getHibernateTemplate().save(user);
	}
	/**
	 * 获取用户方法
	 * @param id 用户唯一标识符
	 * @return 获取到的用户
	 */
	public User get(Integer id){
		return getHibernateTemplate().get(User.class, id);
	}
	public User get(String account) {
		Session session=currentSession();
		Query query=session.createQuery(" select user from User user where user.account = '"+account+"'");
		return (User) query.uniqueResult();
	}
	/*以此方法完成反转注入*/
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}