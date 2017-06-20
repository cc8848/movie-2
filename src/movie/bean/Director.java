package movie.bean;

import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Type;

/**
 * 导演实体类
 * 
 */
@Entity
public class Director {
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
