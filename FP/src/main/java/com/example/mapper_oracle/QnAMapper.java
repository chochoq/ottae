package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.QnAVO;

public interface QnAMapper {
	
	public List<QnAVO> qlist(@Param("query")String query,@Param("cri") Criteria cri);
	   
	public void qinsert(QnAVO vo);
	   
	public void qupdatepost(QnAVO vo);
	  
	public QnAVO qread(int q_no);
	   
	public void qdelete(int q_no);
		
	public int totalCount(String query);
	  
}
