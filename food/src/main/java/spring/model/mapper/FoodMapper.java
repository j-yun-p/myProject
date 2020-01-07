package spring.model.mapper;

import java.util.List;

import spring.model.food.FoodDTO;

public interface FoodMapper {
	
	List<FoodDTO> list();
	int create(FoodDTO dto);
	int delete(int food_id);
}
