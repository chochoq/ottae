package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> nlist();
   
   public void ninsert(NoticeVO vo);
   
   public void nupdatepost(NoticeVO vo);
   
   public NoticeVO nread(int n_no);
   
   public void ndelete(int n_no);
   
}