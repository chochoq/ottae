package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CbVO;
import com.example.domain.Criteria;

public interface CbMapper {

	// 동아리 first page에서 5개의 게시물 가져오기
	public List<CbVO> first_cblist(String c_code);
	
	// 동아리 board page에서 10개의 게시물 가져오기 + 검색
	public List<CbVO> list_cblist(Criteria cri);

	public void cbInsert(CbVO vo);

	public CbVO cbread(int cb_no);

	public void cbUpdatepost(CbVO vo);

	public void cbDelete(int cb_no);

	public void cbrDelete(int cbr_no);
	
	// 특정 동아리 board 총 개수
	public int total(String c_code);

	// 마스터 유저 삭제
	public void deletecb(String id);

	// 마스터 동아리 회장 유저 삭제
	public void deletepcb(String c_code);

	// 내 정보 삭제
	public void deletemycb(@Param("id") String id, @Param("c_code") String c_code);
}
