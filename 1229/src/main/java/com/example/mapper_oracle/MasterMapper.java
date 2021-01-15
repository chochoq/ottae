package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.club.ClubVO;
import com.example.domain.Criteria;
import com.example.domain.group.GroupVO;
import com.example.domain.user.UserVO;

public interface MasterMapper {

	public List<UserVO> mulist(Criteria cri);

	public int mutotalCount(Criteria cri);

	public List<ClubVO> mclist(Criteria cri);

	public int mctotalCount(Criteria cri);

	public List<GroupVO> mglist(Criteria cri);

	public int mgtotalCount(Criteria cri);

	public void mudelete(String id);

}
