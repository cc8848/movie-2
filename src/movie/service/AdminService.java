package movie.service;

import javax.annotation.Resource;

import movie.bean.*;
import movie.dao.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 管理类Service
 * @author 杨赟
 */
@Service
@Transactional
public class AdminService {
	@Resource UserDAO userDAO;
	@Resource MovieDAO movieDAO;
	@Resource CommentDAO commentDAO;
	@Resource KindDAO kindDAO;
	public void deleteComment(Integer id){
		commentDAO.delete(id);
	}
	public void addMovie(Movie movie,Integer kindId){
		Kind kind=kindDAO.get(kindId);
		movie.setKind(kind);
		movieDAO.add(movie);
	}
	public void deleteMovie(Integer id) {
		movieDAO.delete(id);
	}
	public void edit(Movie movie) {
		Movie src=movieDAO.get(movie.getId());
		src.setDescription(movie.getDescription());
		src.setName(movie.getName());
		src.setUrl(movie.getUrl());
		src.setKind(kindDAO.get(movie.getKind().getId()));
		movieDAO.updata(movie);
	}
}