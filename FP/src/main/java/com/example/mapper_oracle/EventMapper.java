package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.EventVO;

public interface EventMapper {
	
	public List<EventVO> elist();
	
	public void einsert(EventVO vo);
	
	public EventVO eread(int e_no);
	
	public void eupdatepost(EventVO vo);
	
	public void edelete(int e_no);
	
}
