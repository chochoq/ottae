package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.QnAVO;

public interface QnAMapper {
	
		public List<QnAVO> qlist();
	   
		public void qinsert(QnAVO vo);
	   
		public void qupdatepost(QnAVO vo);
	   
		public QnAVO qread(int q_no);
	   
		public void qdelete(int q_no);
	  
}
