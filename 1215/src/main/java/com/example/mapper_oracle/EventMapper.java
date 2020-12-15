package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.EventVO;

public interface EventMapper {
	
	public List<EventVO> elist(@Param("query")String query,@Param("cri") Criteria cri);
	
	public void einsert(EventVO vo);
	
	public void eupdatepost(EventVO vo);
	
	public EventVO eread(int e_no);
	
	public void edelete(int e_no);
	
	public int totalCount(String query);
	
}
