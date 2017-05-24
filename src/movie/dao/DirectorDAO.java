package movie.dao;

import javax.annotation.Resource;

import movie.bean.Director;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 导演类DAO
 * 
 * @author 杨赟
 */
@Repository
public class DirectorDAO extends HibernateDaoSupport {
	/**
	 * 获取导演方法
	 * 
	 * @param id 导演唯一标识符
	 * @return 获取到的导演
	 */
	public Director get(Integer id) {
		return getHibernateTemplate().get(Director.class, id);
	}

	/* 以此方法完成反转注入 */
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}