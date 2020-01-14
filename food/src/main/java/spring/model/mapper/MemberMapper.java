package spring.model.mapper;

import java.util.Map;

import spring.model.food.MemberDTO;

public interface MemberMapper {
	
	int create(MemberDTO dto);
	int duplicateId(String id);
	int duplicateEmail(String email);
	int loginCheck(Map map);
	String getGrade(String id);
	String findId(Map map);
	String findPw(Map map);
	MemberDTO read(String id);
	int update(MemberDTO dto);
	int updatePw(Map map);
	int delete(String id);

}
