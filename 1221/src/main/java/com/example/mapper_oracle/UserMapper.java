package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.UserVO;

public interface UserMapper {
	public String getTime();
	
	public void signup(UserVO vo);
	
	public UserVO read(String id);
	
	public List<UserVO> list(String query);
	
	public int idchk(String id);

}
