package movie.service;

import java.util.List;

import javax.annotation.Resource;

import movie.dao.*;
import movie.bean.*;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MovieService {
	@Resource KindDAO kindDAO;
	@Resource MovieDAO movieDAO;
	public Kind getKind(Integer id) {
		return kindDAO.get(id);
	}
	public Movie getMovie(Integer id){
		Movie movie=movieDAO.get(id);
		return movie;
	}
	public List<Movie> newset(){
		return movieDAO.newest();
	}
}