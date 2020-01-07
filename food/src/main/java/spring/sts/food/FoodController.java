package spring.sts.food;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import spring.model.food.FoodDTO;
import spring.model.mapper.FoodMapper;
import spring.utility.food.Utility;

@Controller
public class FoodController {
	
	@Autowired
	private FoodMapper fmapper;
	
	@PostMapping("/create")
	public String create(FoodDTO dto, HttpServletRequest request) {
		
		String food_content = dto.getFood_content().replaceAll("\r\n", "<br>");
		dto.setFood_content(food_content);
		dto.setFood_star(Integer.parseInt(request.getParameter("food_star")));
		
		String basePath = request.getRealPath("/food_storage");
		System.out.println("basepath >>>>>>> "+basePath);
		if(dto.getFood_imgMF().getSize()>0) {
			dto.setFood_img(Utility.saveFileSpring(dto.getFood_imgMF(), basePath));
		}
		fmapper.create(dto);
		
		return "redirect:/";
	}
	@GetMapping("/delete")
	public String delete(int food_id, HttpServletRequest request, String oldfile) {
		
		fmapper.delete(food_id);
		String basePath = request.getRealPath("/food_storage");
		Utility.deleteFile(basePath, oldfile);
		
		return "redirect:/";
	}

}
