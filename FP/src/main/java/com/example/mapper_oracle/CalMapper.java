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

	// g_code 일정 리스트 가져오기
	public List<CalVO> scheduleList(int g_code);
	
	// 아이디로 일정 리스트 가져오기
	public List<CalVO> myscheduleList(String id);

	// insert
	public void scheduleinsert(CalVO vo);

	// 전체 update
	public void scheduleupdate(CalVO vo);

	// dragupdate
	public void dragupdate(CalVO vo);

	// 삭제
	public void scheduledelete(int calno);

}
