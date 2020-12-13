package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> nlist(@Param("query")String query,@Param("cri") Criteria cri);
   
	public void ninsert(NoticeVO vo);
   
	public void nupdatepost(NoticeVO vo);
   
	public NoticeVO nread(int n_no);
   
	public void ndelete(int n_no);
   
	public int totalCount(String query);
   
}