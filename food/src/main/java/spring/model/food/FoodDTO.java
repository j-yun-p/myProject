package spring.model.food;

import org.springframework.web.multipart.MultipartFile;

public class FoodDTO {
	
	private int			  food_id 		;
	private String 		  food_title 	;
	private String 		  food_content 	;
	private int			  food_star		; 
	private String 		  food_img 		;
	private MultipartFile food_imgMF	;
	
	
	public FoodDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodDTO(int food_id, String food_title, String food_content, String food_img) {
		super();
		this.food_id = food_id;
		this.food_title = food_title;
		this.food_content = food_content;
		this.food_img = food_img;
	}

	@Override
	public String toString() {
		return "FoodDTO [food_id=" + food_id + ", food_title=" + food_title + ", food_content=" + food_content
				+ ", food_img=" + food_img + "]";
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public String getFood_title() {
		return food_title;
	}

	public void setFood_title(String food_title) {
		this.food_title = food_title;
	}

	public String getFood_content() {
		return food_content;
	}

	public void setFood_content(String food_content) {
		this.food_content = food_content;
	}

	public String getFood_img() {
		return food_img;
	}

	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}

	public MultipartFile getFood_imgMF() {
		return food_imgMF;
	}

	public void setFood_imgMF(MultipartFile food_imgMF) {
		this.food_imgMF = food_imgMF;
	}

	public int getFood_star() {
		return food_star;
	}

	public void setFood_star(int food_star) {
		this.food_star = food_star;
	}

	
}
