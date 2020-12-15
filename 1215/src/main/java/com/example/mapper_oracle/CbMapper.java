package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CbVO;

public interface CbMapper {

	public List<CbVO> first_cblist(String c_code);
	public List<CbVO> list_cblist(String c_code);

	public void cbInsert(CbVO vo);

	public CbVO cbread(int cb_no);

	public void cbUpdatepost(CbVO vo);

	public void cbDelete(int cb_no);

	public void cbrDelete(int cbr_no);

	// 마스터 유저 삭제
	public void deletecb(String id);

	// 마스터 동아리 회장 유저 삭제
	public void deletepcb(String c_code);

	// 내 정보 삭제
	public void deletemycb(@Param("id") String id, @Param("c_code") String c_code);
}
