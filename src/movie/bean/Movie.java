package movie.bean;

import java.util.*;

import javax.persistence.*;

import org.hibernate.annotations.Type;

/**
 * 电影类实体类
 * @author 杨赟
 */
@Entity
public class Movie {
	/*主键 自动增长 id*/
	@Id
	@GeneratedValue
	@OrderBy(value="id DESC")
	private Integer id;
	/*电影名字*/
	private String name;
	/*电影简介*/
	@Type(type="text")
	private String description;
	/*海报图片名字*/
	private String imageName;
	/*电影评分*/
	//private Float score;
	/*电影播放链接*/
	private String url;
	/*播放次数*/
	private Long count;
	/*电影类别*/
	@ManyToOne(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn
	private Kind kind;
	/*评论列表 一对多 按评论id排序*/
	@OneToMany(targetEntity=Comment.class,cascade = CascadeType.ALL)
	@JoinColumn(name="movie_id")
	private List<Comment> comments=new LinkedList<Comment>();
	/*getter and setter*/
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	/*public Float getScore() {
		return score;
	}
	public void setScore(Float score) {
		this.score = score;
	}*/
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
}