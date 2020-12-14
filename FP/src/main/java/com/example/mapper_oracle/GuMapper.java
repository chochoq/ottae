package com.example.mapper_oracle;

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
}