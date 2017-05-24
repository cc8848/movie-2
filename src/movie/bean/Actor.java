package movie.bean;

import javax.persistence.*;

import org.hibernate.annotations.Type;

/**
 * 演员实体类
 * 
 * @author 杨赟
 */
@Entity
public class Actor {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	@Type(type = "text")
	private String description;
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
}
