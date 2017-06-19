package movie.action;

import java.util.List;

import javax.annotation.Resource;

import movie.bean.Kind;
import movie.service.MovieService;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class IndexAction  extends ActionSupport{
	@Resource
	MovieService movieService;
	private List<Kind> kinds;
	public String execute(){
		setKinds(movieService.listKind());
		return "indexjsp";
	}
	public List<Kind> getKinds() {
		return kinds;
	}
	public void setKinds(List<Kind> kinds) {
		this.kinds = kinds;
	}
}