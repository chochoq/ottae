package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CnrVO;
import com.example.domain.Criteria;

public interface CnrMapper {
   public void insertCnr(CnrVO vo);
   public List<CnrVO> ListCnr(@Param("cn_no")int cn_no, @Param("cri") Criteria cri);
   public int totalCount(int cn_no);
   public void cnrDelete(int cnr_no);
}