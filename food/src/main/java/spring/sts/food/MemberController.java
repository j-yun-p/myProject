package spring.sts.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.food.MemberDTO;
import spring.model.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mmapper;
	
	@RequestMapping("/member/create")
	public String create(MemberDTO dto) {
		
		return "/member/create";
	}

}
