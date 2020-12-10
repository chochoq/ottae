package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface MasterMapper {
	public List<UserVO> mulist(Criteria cri);
	
	public int mutotalCount(Criteria cri);

}
