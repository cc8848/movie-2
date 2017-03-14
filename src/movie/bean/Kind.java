package movie.bean;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

/**
 * 电影类别实体类
 * @author 杨赟
 */
@Entity
public class Kind {
	/*主键 自动增长 id*/
	@Id
	@GeneratedValue
	private Integer id;
	/*电影类名 数据库唯一*/
	@Column(unique=true)
	private String name;
	/*该类别下的电影 外键 一对多 即时加载*/
	@OneToMany(fetch=FetchType.EAGER,targetEntity=Movie.class,mappedBy="kind")
	@OrderBy(value="id DESC")
	private List<Movie> movies=new LinkedList<Movie>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Movie> getMovies() {
		return movies;
	}
	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
}