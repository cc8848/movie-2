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
	@Resource
	KindDAO kindDAO;
	@Resource
	MovieDAO movieDAO;
	@Resource
	DirectorDAO directorDAO;
	@Resource
	ActorDAO actorDAO;
	
	public List<Kind> listKind(){
		return kindDAO.list();
	}
	public List<Movie> listMovie(){
		return movieDAO.list();
	}
	public List<Director> listDirector(){
		return directorDAO.list();
	}
	public List<Actor> listActor(){
		return actorDAO.list();
	}
	public Kind getKind(Integer id) {
		return kindDAO.get(id);
	}

	public Movie getMovie(Integer id) {
		Movie movie = movieDAO.get(id);
		return movie;
	}
	public List<Movie> newset() {
		return movieDAO.newest();
	}

	public Director getDirector(Integer id) {
		return directorDAO.get(id);
	}

	public Actor getActor(Integer id) {
		return actorDAO.get(id);
	}
	public void deleteKind(Kind kind) {
		kindDAO.delete(kind);
	}
	public boolean deleteActor(Actor actor) {
		return actorDAO.delete(actor);
	}
	public boolean deleteDirector(Director director) {
		return directorDAO.delete(director);
	}
	public void addKind(Kind kind) {
		kindDAO.add(kind);
	}
	public void addActor(Actor actor) {
		actorDAO.add(actor);
	}
	public void addDirector(Director director) {
		directorDAO.add(director);
	}
	public void editKind(Kind kind) {
		kindDAO.edit(kind);
	}
	public void editActor(Actor actor) {
		//actorDAO.edit(actor);
	}
	public void editDirector(Director director) {
		//directorDAO.edit(director);
	}
}