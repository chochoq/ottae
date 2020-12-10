package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.GroupVO;
import com.example.domain.GuVO;
import com.example.domain.UserVO;

public interface GroupMapper {
	
	public void makeGroup(GroupVO vo);
	
	public List<GuVO> mygroup(String id);
	
	public List<UserVO> guget(GroupVO vo);
	
	public List<GuVO> GroupList(String id);
	
}
