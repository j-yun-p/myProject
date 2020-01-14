package spring.sts.food;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.food.MemberDTO;
import spring.model.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mmapper;
	
	@GetMapping("/member/mypage")
	public String mypage(String id,HttpSession session, Model model) {
		
		if(id==null) id=(String)session.getAttribute("id");
		MemberDTO dto = mmapper.read(id);
		model.addAttribute("dto", dto);
		
		
		return "/read";
	}
	
	@GetMapping("/member/update")
	public String update(String id,HttpSession session, Model model) {
		if(id==null) id=(String)session.getAttribute("id");
		
		MemberDTO dto = mmapper.read(id);
		model.addAttribute("dto", dto);
		return "/update";
	}
	
	@PostMapping("/member/update")
	public String update(MemberDTO dto, Model model) {
		int flag = mmapper.update(dto);
		
		if(flag==1) {
			model.addAttribute("id", dto.getId());
			return "redirect:./mypage";
		} else {
			return "error";
		}
	}
	
	@PostMapping("/member/updatePw")
	public String updatePw(String passwd, HttpSession session) {
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("passwd", passwd);
		
		int flag = mmapper.updatePw(map);
		
		if(flag==1) {
			return "redirect:/";
		} else {
			return "error";
		}
		
	}
	@GetMapping("/member/updatePw")
	public String updatePw() {
		
		return "/updatePw";
	}
	
	
	@PostMapping("/member/delete")
	public String delete(String id, HttpSession session, HttpServletRequest request) {
	
		int flag = mmapper.delete(id);
		
		if(flag==1) session.invalidate();
		
		if(flag==1) {
			return "redirect:/";
		} else {
			return "error";
		}
	}
	
	@GetMapping("/member/delete")
	public String delete() {
		
		return "/delete";
	}
	
	
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) {
		int flag = mmapper.loginCheck(map);
		String grade = null;
		
		if(flag==1) {
			grade = mmapper.getGrade(map.get("id"));

			session.setAttribute("id", map.get("id")); // 현재 아이디 저장
			session.setAttribute("grade", grade); // 현재 아이디 저장

			// ----------------Cookie저장, checkbox선택안하면 null--------
			Cookie cookie = null;

			String c_id = request.getParameter("c_id");

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(60*60*24*365); // 1년
				response.addCookie(cookie); // 쿠키기록

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie); // 쿠키기록

			} else {
				cookie = new Cookie("c_id", ""); // 쿠키삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");// 쿠키삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}		
		
		if(flag==1) {
			return "redirect:/";
		} else {
			request.setAttribute("str", "아이디 또는 비밀번호를 잘못입력 했거나 <br> 회원이 아닙니다.");
			return "/preProc";
		}
	}
	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		//Cookie
		String c_id = ""; //id 저장여부 저장
		String c_id_val = ""; //id 값
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		
		return "/login";
	}
	
	
	@PostMapping("/member/pwFind")
	public String pwFind(HttpServletRequest request) {
		String mname = request.getParameter("name");
		String id = request.getParameter("id");
		
		Map map = new HashMap();
		map.put("name", mname);
		map.put("id", id);
		
		String passwd = mmapper.findPw(map);
		request.setAttribute("passwd", passwd);
		
		return "member/pwFind_proc";
	}
	
	@GetMapping("/member/pwFind")
	public String pwFind() {
		
		return "member/pwFind_form";
	}
	
	@PostMapping("/member/idFind")
	public String idFind(HttpServletRequest request) {
		String mname = request.getParameter("name");
		String email = request.getParameter("email");
		
		Map map = new HashMap();
		map.put("name", mname);
		map.put("email", email);
		
		
		String id = mmapper.findId(map);
		request.setAttribute("id", id);
		
		return "member/idFind_proc";
	}
	@GetMapping("/member/idFind")
	public String idFind() {
		
		return "member/idFind_form";
	}
	
	
	@RequestMapping("/member/agree")
	public String agree() {
		
		return "/agree";
	}
	@PostMapping("/member/create")
	public String create(MemberDTO dto) {
		
		return "/member/create";
	}

	@PostMapping("/member/createProc")
	public String createProc(MemberDTO dto, Model model) {
		
		String url = "/preProc";
		if(mmapper.duplicateId(dto.getId())==1) {
			model.addAttribute("str", "중복된 아이디입니다. 중복체크해 주세요.");
		} else if (mmapper.duplicateEmail(dto.getEmail())==1) {
			model.addAttribute("str", "중복된 이메일입니다. 중복체크해 주세요.");
		} else {
			if(mmapper.create(dto)==1) {
				url = "redirect:/";
			}else {
				url = "error";
			}
		}
		return url;
	}
	
	@ResponseBody
	@GetMapping(value = "/member/idcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> idcheck(String id) {		
		int flag = mmapper.duplicateId(id);
		Map<String, Object> map = new HashMap<String, Object>();

		if (flag==1) {
			map.put("str", id + " is already in use. It's not available.");
		} else {
			map.put("str", id + " is not in use. It's possible to use.");
		}
		return map;
	}
	@ResponseBody
	@GetMapping(value = "/member/emailcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> emailcheck(String email) {
		int flag = mmapper.duplicateEmail(email);
		Map<String, Object> map = new HashMap<String, Object>();
		if (flag==1) {
			map.put("str", email + "is already in use. It's not available.");
		} else {
			map.put("str", email + "is not in use. It's possible to use.");
		}
		return map;
	}


}
