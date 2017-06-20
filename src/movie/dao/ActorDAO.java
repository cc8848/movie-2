package movie.dao;

import java.util.List;

import javax.annotation.Resource;

import movie.bean.Actor;
import movie.bean.Kind;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 演员类DAO
 * 
 */
@Repository
public class ActorDAO extends HibernateDaoSupport {
	/**
	 * 获取演员方法
	 * 
	 * @param id 演员唯一标识符
	 * @return 获取到的演员
	 */
	public Actor get(Integer id) {
		return getHibernateTemplate().get(Actor.class, id);
	}

	/* 以此方法完成反转注入 */
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public List<Actor> list() {
		return (List<Actor>) getHibernateTemplate().find(" select actor from Actor actor ");
	}

	public boolean delete(Actor actor) {
		getHibernateTemplate().delete(actor);
		return true;
	}

	public void add(Actor actor) {
		actor.setId(1);
		getHibernateTemplate().save(actor);
	}
}