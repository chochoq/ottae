package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CnVO;
import com.example.domain.CnrVO;

public interface CnMapper {

	public void cninsert(CnVO vo);

	public void cnupdatepost(CnVO vo);

	public CnVO cnread(int cn_no);

	public List<CnVO> first_cnlist(String c_code);
	public List<CnVO> list_cnlist(String c_code);

	public void cndelete(int cn_no);

	public CnrVO cnrlist(int cnr_no);

	public void cnrdelete(int cnr_no);

	// 마스터 유저 삭제
	public void deletecn(String id);

	// 마스터 유저 삭제
	public void deletepcn(String c_code);

	// 마스터 유저 삭제
	public void deletemycn(@Param("id") String id, @Param("c_code") String c_code);
}
