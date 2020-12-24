package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CnVO;
import com.example.domain.CnrVO;
import com.example.domain.Criteria;

public interface CnMapper {

	public void cninsert(CnVO vo);

	public void cnupdatepost(CnVO vo);

	public CnVO cnread(int cn_no);

	// 동아리 first page에서 5개의 공지사항만 가져오기
	public List<CnVO> first_cnlist(String c_code);
	
	// 동아리 notice page에서 10개의 공지사항만 가져오기 + 검색
	public List<CnVO> list_cnlist(Criteria cri);

	public void cndelete(int cn_no);

	public CnrVO cnrlist(int cnr_no);

	public void cnrdelete(int cnr_no);
	
	// 특정 동아리 notice 총 개수
	public int total(String c_code);

	// 마스터 유저 삭제
	public void deletecn(String id);

	// 마스터 유저 삭제
	public void deletepcn(String c_code);

	// 마스터 유저 삭제
	public void deletemycn(@Param("id") String id, @Param("c_code") String c_code);
}
