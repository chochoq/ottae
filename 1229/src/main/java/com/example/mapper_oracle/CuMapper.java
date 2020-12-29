package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ClubVO;
import com.example.domain.Criteria;
import com.example.domain.CuVO;

public interface CuMapper {

	public int totalCount(String c_code);
	
	public int totalCountAll(String c_code);

	public List<CuVO> wCulist(@Param("c_code") String c_code, @Param("cri") Criteria cri);
	
	public List<CuVO> allCulist(@Param("c_code") String c_code, @Param("cri") Criteria cri);

	public void approveCu(CuVO vo);

	public String chkCu(@Param("c_code") String c_code, @Param("id") String id);

	public void addMember(CuVO vo);

	public List<ClubVO> myClub(String id);

	public void outCu(CuVO vo);

	// 마스터 유저 삭제
	public void deletecu(String id);

	// 마스터 동아리 회장 유저 삭제
	public void deletepcu(String c_code);

	// 마스터 유저 삭제
	public void deletemycu(@Param("id") String id, @Param("c_code") String c_code);

	// for 문 반복 횟수
	public int countcuid(String id);

	// max 값 검색
	public String searchmax(String id);

	// pid 비교
	public int searchpid(@Param("id") String id, @Param("c_code") String c_code);
	
	public int maincount(String c_code);
	
	public CuVO getCuInfo(@Param("c_code") String c_code, @Param("id") String id);
}
