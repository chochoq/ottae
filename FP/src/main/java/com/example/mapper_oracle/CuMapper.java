package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ClubVO;
import com.example.domain.Criteria;
import com.example.domain.CuVO;

public interface CuMapper {
	
	public int totalCount(String c_code);
	
	public List<CuVO> wCulist(@Param("c_code")String c_code, @Param("cri") Criteria cri);
	
	public void approveCu(CuVO vo); 
	
	public String chkCu(@Param("c_code")String c_code,@Param("id")String id);
	
	public void addMember(CuVO vo);
	
	public List<ClubVO> myClub(String id);
	
	public void outCu(CuVO vo);
}
