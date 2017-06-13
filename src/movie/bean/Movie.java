package movie.bean;

import java.util.*;

import javax.persistence.*;

import org.hibernate.annotations.Type;

/**
 * 电影类实体类
 * 
 */
@Entity
public class Movie {
	/* 主键 自动增长 id */
	@Id
	@GeneratedValue
	@OrderBy(value = "id DESC")
	private Integer id;
	/* 电影名字 */
	private String name;
	/* 电影简介 */
	@Type(type = "text")
	private String description;
	/* 海报图片名字 */
	private String imageName;
	/* 电影评分 */
	// private Float score;
	/* 电影播放链接 */
	private String url;
	/* 播放次数 */
	private Long count;
	/* 电影导演 */
	private String director;
	/* 电影导演简介 */
	private String introduction;
	/* 电影导演 生日 */
	private String birthday;
	/* 电影导演 家乡 */
	private String hometown;
	/* 电影导演奖项 */
	private String prize;
	/* 导演代表作1 */
	private String works1;
	/* 导演代表作2 */
	private String works2;
	/* 导演代表作3 */
	private String works3;
	/* 电影主角 1 */
	private String actors1;
	/* 电影主角 2 */
	private String actors2;
	/* 电影主角 3 */
	private String actors3;
	/* 电影类别 */
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn
	private Kind kind;
	/* 评论列表 一对多 按评论id排序 */
	@OneToMany(targetEntity = Comment.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "movie_id")
	private List<Comment> comments = new LinkedList<Comment>();

	/* getter and setter */
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

	/*
	 * public Float getScore() { return score; } public void setScore(Float
	 * score) { this.score = score; }
	 */
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

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getPrize() {
		return prize;
	}

	public void setPrize(String prize) {
		this.prize = prize;
	}

	public String getWorks1() {
		return works1;
	}

	public void setWorks1(String works1) {
		this.works1 = works1;
	}

	public String getWorks2() {
		return works2;
	}

	public void setWorks2(String works2) {
		this.works2 = works2;
	}

	public String getWorks3() {
		return works3;
	}

	public void setWorks3(String works3) {
		this.works3 = works3;
	}

	public String getActors1() {
		return actors1;
	}

	public void setActors1(String actors1) {
		this.actors1 = actors1;
	}

	public String getActors2() {
		return actors2;
	}

	public void setActors2(String actors2) {
		this.actors2 = actors2;
	}

	public String getActors3() {
		return actors3;
	}

	public void setActors3(String actors3) {
		this.actors3 = actors3;
	}

}