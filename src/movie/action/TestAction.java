package movie.action;

import javax.annotation.Resource;

import movie.bean.*;
import movie.service.MovieService;
import movie.service.TestService;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 测试类Action
 * @author 杨赟
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class TestAction extends ActionSupport{
	@Resource TestService service;
	@Resource MovieService movieService;
	public String execute(){
		init();
		return "";
	}
	public String init(){
		User user=new User();
		user.setAccount("admin");
		user.setPassword("admin");
		user.setUsername("系统管理员");
		user.setAdmin(true);
		service.test(user);
		Kind kind=new Kind();
		kind.setName("爱情");
		service.test(kind);
		
		kind=new Kind();
		kind.setName("喜剧");
		service.test(kind);
		
		kind=new Kind();
		kind.setName("动漫");
		service.test(kind);
		
		kind=new Kind();
		kind.setName("悬疑");
		service.test(kind);
		
		return "";
	}
	public String test(){
		User user=new User();
		user.setAccount("0001");
		user.setUsername("YangYun");
		user.setPassword("xxx");
		service.test(user);
		Comment comment=new Comment();
		comment.setUser(user);
		comment.setCommentText("评论评论评论");
		service.test(comment);
		Movie movie=new Movie();
		movie.setName("你的名字");
		movie.setImageName("null");
		movie.setUrl("url");
		movie.setDescription("你的名字，你的名字");
		movie.setKind(movieService.getKind(1));
		service.test(movie);
		return "";
	}
}