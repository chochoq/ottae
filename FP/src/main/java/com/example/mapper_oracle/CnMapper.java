package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.CnVO;
import com.example.domain.CnrVO;

public interface CnMapper {
	
	public void cninsert(CnVO vo);
	
	public void cnupdatepost(CnVO vo);
	
	public CnVO cnread(int cn_no);
	
	public List<CnVO> cnlist(String c_code);
	
	public void cndelete(int cn_no);
	
	public CnrVO cnrlist(int cnr_no);
	
	public void cnrdelete(int cnr_no);
}
