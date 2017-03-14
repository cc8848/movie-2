package movie.bean;

import javax.persistence.*;

import org.hibernate.annotations.Type;

/**
 * 评论类实体类
 * @author 杨赟
 */
@Entity
public class Comment {
	/*主键 自动增长 id*/
	@Id
	@GeneratedValue
	private Integer id;
	/*评论 长文本类型*/
	@Type(type="text")
	private String commentText;
	/*发表该评论的用户 一对一*/
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private User user;
	/*getter and setter*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}