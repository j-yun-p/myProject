package vip;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import vip.VipDAO;
import vip.VipDTO;

public class VipTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		VipDAO dao = new VipDAO();
		
		//total(dao);
		//list(dao);
		//create(dao);
		//upViewcnt(dao);
		//read(dao);
		//passCheck(dao);
		//update(dao);
		//delete(dao);
		
	}

	private static void total(VipDAO dao) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		map.put("col", "wanme");
		map.put("word", "");
		
		p("게시만 갯수 : " + dao.total(map));
		
		 
		
	}

	private static void delete(VipDAO dao) {
		int no = 3;
		if(dao.delete(no)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void update(VipDAO dao) {
		
		VipDTO dto = dao.read(3);
		dto.setWname("신길동");
		dto.setTitle("제목제목");
		dto.setContent("고쳤음");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void passCheck(VipDAO dao) {
		Map map = new HashMap();
		map.put("no", 3);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
		
	}

	private static void read(VipDAO dao) {
		int no = 1;
		
		VipDTO dto =	dao.read(no);
		p(dto);
	}

	private static void upViewcnt(VipDAO dao) {
		int no = 3;
		dao.upViewcnt(no);
	}

	private static void create(VipDAO dao) {
		VipDTO dto = new VipDTO();
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

	private static void list(VipDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<VipDTO> list = dao.list(map);
		
		Iterator<VipDTO> iter = list.iterator();
		while(iter.hasNext()) {
			VipDTO dto = iter.next();
			p(dto);
			p("---------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(VipDTO dto) {
		// TODO Auto-generated method stub
		p("번  호 : " + dto.getNo());
		p("글쓴이 : " + dto.getWname());
		p("제  목 : " + dto.getTitle());
		p("조회수 : " + dto.getViewcnt());
		p("날  짜 : " + dto.getWdate());
	}
}
