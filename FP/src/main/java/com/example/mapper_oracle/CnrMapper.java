package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CnrVO;
import com.example.domain.Criteria;

public interface CnrMapper {
	public void insertCnr(CnrVO vo);

	public List<CnrVO> ListCnr(@Param("cn_no") int cn_no, @Param("cri") Criteria cri);

	public int totalCount(int cn_no);

	public void cnrDelete(int cnr_no);

	// 마스터 유저 삭제
	public void deletecnr(String id);

	// 마스터 동아리 회장 유저 삭제
	public void deletepcnr(String c_code);
	
	// 내 정보 삭제
	   public void deletemycnr(@Param("id")String id, @Param("c_code")String c_code);
}