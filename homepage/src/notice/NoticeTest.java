package notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class NoticeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		NoticeDAO dao = new NoticeDAO();
		
		//list(dao);
		total(dao);
		//create(dao);
		//read(dao);
		//upViewcnt(dao);
		//passCheck(dao);
		//update(dao);
		//delete(dao);

	}

	private static void total(NoticeDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		
		p("공지사항 갯수 : " + dao.total(map));
	}

	private static void delete(NoticeDAO dao) {
		// TODO Auto-generated method stub
		int no=1;
		if(dao.delete(no)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(NoticeDAO dao) {
		// TODO Auto-generated method stub
		
		NoticeDTO dto = dao.read(1);
		dto.setTitle("수정");
		dto.setContent("수정했음");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void passCheck(NoticeDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("no", 2);
		map.put("passwd", "123");
		
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다.");
		}
				
	}

	private static void upViewcnt(NoticeDAO dao) {
		// TODO Auto-generated method stub
		int no =2;
		dao.upViewcnt(no);	
		
	}

	private static void read(NoticeDAO dao) {
		// TODO Auto-generated method stub
		int no = 1;
		NoticeDTO dto = dao.read(no);
		p(dto);
	}

	private static void create(NoticeDAO dao) {
		// TODO Auto-generated method stub
		
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle("수업공지222");
		dto.setContent("안해요");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void list(NoticeDAO dao) {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NoticeDTO> list = dao.list(map);
		Iterator<NoticeDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			NoticeDTO dto = iter.next();
			p(dto);
			p("-------------------------");
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(NoticeDTO dto) {
		p("번  호 : " + dto.getNo());
		p("작성자 : " + dto.getId());
		p("제  목 : " + dto.getTitle());
		p("조회수 : " + dto.getViewcnt());
		p("날  짜 : " + dto.getWdate());		
	}
}
