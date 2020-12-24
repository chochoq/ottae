package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ClubVO;
import com.example.domain.Criteria;

public interface ClubMapper {

	public void insert(ClubVO vo);

	public ClubVO cread(String c_code);

	public List<ClubVO> getGameList();

	public List<ClubVO> getSportList();

	public List<ClubVO> getStudyList();

	public List<ClubVO> getHobbyList();

	public List<ClubVO> getEtcList();

	public String max(String c_pid);

	// 마스터 유저 삭제
	public void deleteclub(String c_code);

	// 삭제 유저 클럽 번호 검색
	public String selectclub(@Param("id")String id, @Param("c_code")String c_code);

	// 삭제 유저 회장 여부
	public int selectpid(String id);
	
	// 동아리를 업데이트 한다 
	public void updateClub(ClubVO vo);
	
	public List<ClubVO> searchcir(Criteria cri);
	   
	public int countcir(Criteria cri);

	// <<<<<<<<<<<<<<<<<<임시>>>>>>>>>>>>>>>>>>>>
	public List<ClubVO> clubList();
}
