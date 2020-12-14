package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.CalVO;

public interface CalMapper {
	public void makeCal(CalVO vo);

	// 마스터 유저 삭제
	public void deleteCal(String id);

	// 일정 리스트
	public List<CalVO> scheduleList(String id);

}
