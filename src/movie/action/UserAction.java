package movie.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import movie.bean.*;
import movie.service.*;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements SessionAware{
	@Resource UserService service;
	private final String INDEX="index"; 
	private Map<String, Object> session;
	private User user;
	private Comment comment;
	private Movie movie;
	public String register(){
		if(user.getAccount()==null||user.getPassword()==null||user.getUsername()==null){
			System.err.println("抛出异常");
		}
		if(user.getAccount().equals("")||user.getPassword().equals("")||user.getUsername().equals("")){
			System.err.println("抛出异常");
		}
		service.register(user);
		this.getActionErrors();
		return INDEX;
	}
	public String login(){
		if(user.getAccount()==null||user.getPassword()==null){
			System.err.println("抛出异常");
		}
		user=service.login(user);
		session.put("user", user);
		return INDEX;
	}
	public String logout(){
		session.put("user", null);
		return INDEX;
	}
	public String addComment(){
		user=(User) session.get("user");
		if(user==null){
			System.err.println("抛出异常");
		}
		service.addComment(movie,user,comment);
		return INDEX;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
}