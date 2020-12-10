package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.ClubVO;

public interface ClubMapper {

	public void insert(ClubVO vo);

	public ClubVO cread(String c_code);

	public List<ClubVO> getGameList();

	public List<ClubVO> getSportList();

	public List<ClubVO> getStudyList();

	public List<ClubVO> getHobbyList();

	public List<ClubVO> getEtcList();
	
	public String max(String c_pid);
	
	
	//<<<<<<<<<<<<<<<<<<임시>>>>>>>>>>>>>>>>>>>>
	public List<ClubVO> clubList();  
}
