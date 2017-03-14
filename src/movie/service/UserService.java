package movie.service;

import javax.annotation.Resource;
import javax.swing.JFrame;
import javax.swing.JTextField;

import org.springframework.transaction.annotation.Transactional;

import movie.dao.*;
import movie.bean.*;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {
	@Resource UserDAO userDAO;
	@Resource CommentDAO commentDAO;
	@Resource MovieDAO movieDAO;
	public User login(User user){
		User loginUser=userDAO.get(user.getAccount());
		if(user.getAccount().equals(loginUser.getAccount())&&user.getPassword().equals(loginUser.getPassword())){
			return loginUser;
		}else{
			System.err.println("用户名或密码错误");
		}
		return null;
	}
	public void addComment(Movie movie, User user, Comment comment) {
		comment.setUser(user);
		commentDAO.add(comment);
		movieDAO.addComment(movie.getId(), comment);
	}
	public void register(User user){
		User re=userDAO.get(user.getAccount());
		if(re!=null){
			System.err.println("用户名已存在");
		}else{
			user.setAdmin(false);
			userDAO.add(user);
		}
	}
}