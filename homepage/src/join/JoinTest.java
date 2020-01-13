package join;

public class JoinTest {

	public static void main(String[] args) {
		
		JoinDAO dao = new JoinDAO();
		
		//IdCheck(dao);
		create(dao);
}

	private static void create(JoinDAO dao) {
		
		JoinDTO dto = new JoinDTO();
		dto.setId("user1");
		dto.setJname("홍길동");
		dto.setPasswd("1234");
		dto.setTel("010-2222-2222");
		dto.setJob("A05");
		dto.setZipcode("1221");
		dto.setAddress1("서울시 종로구 관철동 젊음의 거리");
		dto.setAddress2("코아빌딩 8층");
		dto.setFname("member.jpg");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void IdCheck(JoinDAO dao) {
		
		String id = "user2";
		if(dao.duplicateId(id)) {
			p("id가 중복되었습니다.");
		}else {
			p("id를 사용할 수 있습니다.");
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}
}
