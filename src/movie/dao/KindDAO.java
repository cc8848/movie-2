package movie.dao;

import javax.annotation.Resource;

import movie.bean.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 类别类DAO
 * 
 * @author 杨赟
 */
@Repository
public class KindDAO extends HibernateDaoSupport{
	/**
	 * 添加电影类别
	 * @param kind 要添加的类别
	 */
	public void add(Kind kind){
		kind.setId(1);
		getHibernateTemplate().save(kind);
	}
	/**
	 * 获取电影类别
	 * @param id 电影类别唯一标识符
	 * @return 该类别
	 */
	public Kind get(Integer id){
		return (Kind) getHibernateTemplate().get(Kind.class,id);
	}
	/**
	 * 获取电影类别
	 * @param name 电影类别
	 * @return 该类别
	 */
	public Kind get(String name){
		Session session=currentSession();
		Query query=session.createQuery(" select kind from Kind kind where kind.name = "+name);
		return (Kind) query.uniqueResult();
	}
	/*以此方法完成反转注入*/
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}