package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ClubVO;
import com.example.domain.Criteria;
import com.example.domain.GuVO;
import com.example.domain.UserVO;

public interface MypageMapper {

	public UserVO myinfo(String id);

	public void myinfoupdate(UserVO vo);

	public List<ClubVO> myclist(Criteria cri);

	public int myctotalCount(Criteria cri);

	public int mygtotalCount(Criteria cri);

	public List<GuVO> myglist(Criteria cri);
	
	public void setGu_pwchk(@Param("id")String id,@Param("g_code")int g_code);

}