package movie.dao;

import java.util.List;

import javax.annotation.Resource;

import movie.bean.Comment;
import movie.bean.Movie;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 电影类DAO
 * 实现了电影的增加，获取，为某条电影增加评论功能
 * @author 杨赟
 */
@Repository
public class MovieDAO extends HibernateDaoSupport{
	public void delete(Integer id) {
		HibernateTemplate template=getHibernateTemplate();
		template.delete(template.get(Movie.class,id));
	}
	/**
	 * 添加电影
	 * @param movie 要添加的电影
	 */
	public void add(Movie movie){
		movie.setId(1);
		getHibernateTemplate().save(movie);
	}
	/**
	 * 获取电影
	 * @param id 电影唯一标识符
	 * @return 该电影
	 */
	public Movie get(Integer id){
		HibernateTemplate template=getHibernateTemplate();
		Movie re=(Movie) template.get(Movie.class, id);
		@SuppressWarnings("unchecked")
		List<Comment> comments=(List<Comment>) template.find(" select movie.comments from Movie movie where movie.id = '"+id+"'");
		re.setComments(comments);
		return re;
	}
	/**
	 * 为某条电影添加评论，该方法使用更新电影的方式，不会改变电影原有的属性
	 * @param id 电影唯一标识符
	 * @param comment 要添加的评论
	 * @return 该电影
	 */
	public Movie addComment(Integer id,Comment comment){
		Movie movie=get(id);
		List<Comment> comments=movie.getComments();
		comments.add(comment);
		getHibernateTemplate().update(movie);
		return movie;
	}
	public void updata(Movie movie) {
		getHibernateTemplate().update(movie);
	}
	@SuppressWarnings("unchecked")
	public List<Movie> newest(){
		HibernateTemplate template=getHibernateTemplate();
		template.setMaxResults(6);
		return (List<Movie>) template.find(" from Movie ");
	}
	/*以此方法完成反转注入*/
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}