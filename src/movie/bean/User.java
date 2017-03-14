package movie.bean;

import javax.persistence.*;

/**
 * 用户类实体类
 * @author 杨赟
 */
@Entity
public class User {
	/*主键 自动增长 id*/
	@Id
	@GeneratedValue
	private Integer id;
	/*账户名 数据库唯一*/
	@Column(unique=true)
	private String account;
	/*密码*/
	private String password;
	/*用户名称*/
	private String username;
	/*是否为管理员*/
	private Boolean admin;
	/*getter and setter*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Boolean isAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

}