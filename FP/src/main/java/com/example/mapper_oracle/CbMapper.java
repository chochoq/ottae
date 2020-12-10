package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.CbVO;

public interface CbMapper {
	
	public List<CbVO> cblist(String c_code);
	
	public void cbInsert(CbVO vo);
	
	public CbVO cbread(int cb_no);
	
	public void cbUpdatepost(CbVO vo);
	
	public void cbDelete(int cb_no);
	
	public void cbrDelete(int cbr_no);
}
