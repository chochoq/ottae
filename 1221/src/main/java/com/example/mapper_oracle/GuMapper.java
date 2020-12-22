package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.GuVO;

public interface GuMapper {
	public void addMember(GuVO gvo);
	public Integer max();
	
	//마스터 유저 삭제
	public void deleteMember(@Param("id")String id, @Param("g_code")int g_code);
	   
	//그룹 코드 검색
	public int searchgcode(String id);
	   
	//유저 그룹 count
	public int countgroup(String id);
	   
	//그룹 인원수 검색
	public Integer countgu(int g_code);	
	
	//그룹만 삭제
	public void deleteMemberG_code(int g_code);
	
	// 아이디로 초대된, 그러나 승인은 하지 않은  그룹 list 가져오기
	public List<GuVO> getNotyetGrouplist(String id);
}