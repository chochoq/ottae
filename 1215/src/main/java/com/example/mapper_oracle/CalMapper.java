package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CalVO;
import com.example.domain.GuVO;

public interface CalMapper {
	public void makeCal(CalVO vo);

	// 마스터 유저 삭제
	public void deleteCal(String id);

	// 내가 가입한 그룹 코드 검색
	public GuVO calmygroup(@Param("id") String id, @Param("g_code") int g_code);

	// 그룹 내 일정 리스트
	public List<CalVO> scheduleList(int g_code);

	// insert
	public void scheduleinsert(CalVO vo);

	// 전체 update
	public void scheduleupdate(CalVO vo);

	// dragupdate
	public void dragupdate(CalVO vo);

}
