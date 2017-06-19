package movie.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import movie.bean.*;
import movie.service.*;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport implements SessionAware {
	@Resource
	AdminService service;
	@Resource
	MovieService movieService;
	private Map<String, Object> session;
	private Movie movie;
	private File image;
	private String imageContentType;
	private String imageFileName;
	private Comment comment;
	private Director director;
	private Actor actor;
	public Director getDirector() {
		return director;
	}
	public void setDirector(Director director) {
		this.director = director;
	}
	public Actor getActor() {
		return actor;
	}
	public void setActor(Actor actor) {
		this.actor = actor;
	}
	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}

	private Kind kind;
	private List<Movie> movies;
	private List<Kind> kinds;
	private List<Director> directors;
	private List<Actor> actors;
	public String execute(){
		kinds=movieService.listKind();
		movies=movieService.listMovie();
		directors=movieService.listDirector();
		actors=movieService.listActor();
		return "admin";
	}
	public String editKind(){
		movieService.editKind(kind);
		return "adminAction";
	}
	public String addKind(){
		movieService.addKind(kind);
		return "adminAction";
	}
	public String addActor(){
		movieService.addActor(actor);
		return "adminAction";
	}
	public String addDirector(){
		movieService.addDirector(director);
		return "adminAction";
	}
	public String deleteKind(){
		movieService.deleteKind(kind);
		return "adminAction";
	}
	public String deleteActor(){
		if(movieService.deleteActor(actor)){
			
		}
		return "adminAction";
	}
	public String deleteDirector(){
		movieService.deleteDirector(director);
		return "adminAction";
	}
	public List<Movie> getMovies() {
		return movies;
	}
	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	public List<Kind> getKinds() {
		return kinds;
	}
	public void setKinds(List<Kind> kinds) {
		this.kinds = kinds;
	}
	public List<Director> getDirectors() {
		return directors;
	}
	public void setDirectors(List<Director> directors) {
		this.directors = directors;
	}
	public List<Actor> getActors() {
		return actors;
	}
	public void setActors(List<Actor> actors) {
		this.actors = actors;
	}
	public String movie() {
		movie = movieService.getMovie(movie.getId());
		return "edit";
	}

	public String editMovie() {
		service.edit(movie);
		return "index";
	}

	public String deleteMovie() {
		service.deleteMovie(movie.getId());
		return "index";
	}

	public String deleteComment() {
		service.deleteComment(comment.getId());
		return "index";
	}

	public String addMovie() {
		String path = ServletActionContext.getServletContext().getRealPath(
				"pictures");
		File file = new File(path, imageFileName);
		try {
			FileUtils.copyFile(image, file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		movie.setImageName(imageFileName);
		service.addMovie(movie, movie.getKind().getId());
		return "adminAction";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
}