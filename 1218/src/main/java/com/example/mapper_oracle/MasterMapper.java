package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.ClubVO;
import com.example.domain.Criteria;
import com.example.domain.GroupVO;
import com.example.domain.UserVO;

public interface MasterMapper {

	public List<UserVO> mulist(Criteria cri);

	public int mutotalCount(Criteria cri);

	public List<ClubVO> mclist(Criteria cri);

	public int mctotalCount(Criteria cri);

	public List<GroupVO> mglist(Criteria cri);

	public int mgtotalCount(Criteria cri);

	public void mudelete(String id);

}
