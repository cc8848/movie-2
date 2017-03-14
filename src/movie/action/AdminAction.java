package movie.action;

import java.io.File;
import java.io.IOException;
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
public class AdminAction extends ActionSupport implements SessionAware{
	@Resource AdminService service;
	@Resource MovieService movieService;
	private final String ADMIN="admin"; 
	private Map<String, Object> session;
	private Movie movie;
	private File image;
	private String imageContentType;
	private String imageFileName;
	private Comment comment;
	public String movie(){
		movie=movieService.getMovie(movie.getId());
		return "edit";
	}
	public String editMovie(){
		service.edit(movie);
		return "index";
	}
	public String deleteMovie(){
		service.deleteMovie(movie.getId());
		return "index";
	}
	public String deleteComment(){
		service.deleteComment(comment.getId());
		return "index";
	}
	public String addMovie(){
		String path=ServletActionContext.getServletContext().getRealPath("pictures");
		File file=new File(path, imageFileName);
		try {
			FileUtils.copyFile(image, file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		movie.setImageName(imageFileName);
		service.addMovie(movie,movie.getKind().getId());
		return ADMIN;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
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