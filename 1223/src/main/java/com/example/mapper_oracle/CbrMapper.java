package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CbrVO;
import com.example.domain.Criteria;

public interface CbrMapper {
	public void insertCbr(CbrVO vo);

	public List<CbrVO> ListCbr(@Param("cb_no") int cb_no, @Param("cri") Criteria cri);

	public int totalCount(int cb_no);

	public void cbrDelete(int cbr_no);

	// 마스터 유저 삭제
	public void deletecbr(String id);
	
	// 마스터 동아리회장 유저 삭제
	public void deletepcbr(String c_code);

	// 내 정보 삭제
	public void deletemycbr(@Param("id") String id, @Param("c_code") String c_code);
}
