package guest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GuestTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		GuestDAO dao = new GuestDAO();
		
		total(dao);
		//list(dao);
		//create(dao);
		//upViewcnt(dao);
		//read(dao);
		//passCheck(dao);
		//update(dao);
		//delete(dao);
		
	}

	private static void total(GuestDAO dao) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		map.put("col", "wanme");
		map.put("word", "");
		
		p("게시만 갯수 : " + dao.total(map));
		
		
		
	}

	private static void delete(GuestDAO dao) {
		int no = 3;
		if(dao.delete(no)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void update(GuestDAO dao) {
		
		GuestDTO dto = dao.read(3);
		dto.setWname("신길동");
		dto.setTitle("제목제목");
		dto.setContent("고쳤음");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void passCheck(GuestDAO dao) {
		Map map = new HashMap();
		map.put("no", 3);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
		
	}

	private static void read(GuestDAO dao) {
		int no = 3;
		
		GuestDTO dto =	dao.read(no);
		p(dto);
	}

	private static void upViewcnt(GuestDAO dao) {
		int no = 3;
		dao.upViewcnt(no);
	}

	private static void create(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		dto.setWname("박길동");
		dto.setTitle("제목create");
		dto.setContent("create합니다.");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void list(GuestDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<GuestDTO> list = dao.list(map);
		
		Iterator<GuestDTO> iter = list.iterator();
		while(iter.hasNext()) {
			GuestDTO dto = iter.next();
			p(dto);
			p("---------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(GuestDTO dto) {
		// TODO Auto-generated method stub
		p("번  호 : " + dto.getNo());
		p("글쓴이 : " + dto.getWname());
		p("제  목 : " + dto.getTitle());
		p("조회수 : " + dto.getViewcnt());
		p("날  짜 : " + dto.getWdate());
	}
}
