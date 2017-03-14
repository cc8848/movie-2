package movie.service;

import javax.annotation.Resource;

import movie.bean.*;
import movie.dao.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 测试类Service
 * @author 杨赟
 */
@Service
@Transactional
public class TestService {
	@Resource UserDAO userDAO;
	@Resource MovieDAO movieDAO;
	@Resource CommentDAO commentDAO;
	@Resource KindDAO kindDAO;
	public void test(User user){
		userDAO.add(user);
	}
	public void test(Kind kind){
		kindDAO.add(kind);
	}
	public void test(Movie movie){
		movie.getComments().add(commentDAO.get(1));
		movieDAO.add(movie);
	}
	public void test(Comment comment){
		User user=userDAO.get(comment.getUser().getId());
		comment.setUser(user);
		commentDAO.add(comment);
	}
	public User getUserByAccount(String account){
		return userDAO.get(account);
	}
}