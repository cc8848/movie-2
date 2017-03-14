package movie.dao;

import javax.annotation.Resource;

import movie.bean.Comment;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 评论类DAO
 * 实现了评论的增加，获取功能
 * @author 杨赟
 */
@Repository
public class CommentDAO extends HibernateDaoSupport{
	/**
	 * 添加一条评论
	 * @param comment 评论
	 */
	public void add(Comment comment){
		comment.setId(1);
		getHibernateTemplate().save(comment);
	}
	/**
	 * 获取评论
	 * @param id 评论唯一标识符
	 * @return 该评论
	 */
	public Comment get(Integer id){
		Comment comment=(Comment) getHibernateTemplate().get(Comment.class, id);
		return comment;
	}
	public void delete(Integer id){
		getHibernateTemplate().delete(get(id));
	}
	/*以此方法完成反转注入*/
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}