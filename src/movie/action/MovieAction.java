package movie.action;

import java.util.List;

import javax.annotation.Resource;

import movie.bean.*;
import movie.service.MovieService;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
public class MovieAction extends ActionSupport {
	private final String INDEX="index"; 
	private final String LIST="list"; 
	private final String MOVIE="movie"; 
	@Resource MovieService service;
	private Kind kind;
	private Movie movie;
	private List<Movie> newest;
	public String list(){
		if(kind.getId()==null){
			System.err.println("抛出异常");
		}
		kind=service.getKind(kind.getId());
		newest();
		return LIST;
	}
	public String newest(){
		List<Movie> movies;
		if(kind==null){
			movies=service.newset();
		}else{
			movies=kind.getMovies();
		}
		newest=movies.subList(0,movies.size()>6?6:movies.size());
		return INDEX;
	}
	public String movie(){
		if(movie==null){
			System.err.println("抛出异常");
		}
		movie=service.getMovie(movie.getId());
		return MOVIE;
	}
	/*setter and getter*/
	public MovieService getService() {
		return service;
	}
	public void setService(MovieService service) {
		this.service = service;
	}
	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}
	public String getLIST() {
		return LIST;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public List<Movie> getNewest() {
		return newest;
	}
	public void setNewest(List<Movie> newest) {
		this.newest = newest;
	}
}