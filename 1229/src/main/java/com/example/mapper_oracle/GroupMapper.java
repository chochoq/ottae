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
	
	public GroupVO gread(int g_code);
	
	public UserVO upic(String id);
	
	//마스터 유저 삭제
	public void deletegroup(int g_code);
	
}
