package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CbrVO;
import com.example.domain.Criteria;


public interface CbrMapper {
	   public void insertCbr(CbrVO vo);
	   public List<CbrVO> ListCbr(@Param("cb_no")int cb_no, @Param("cri") Criteria cri);
	   public int totalCount(int cb_no);
	   public void cbrDelete(int cbr_no);
}
