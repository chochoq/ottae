package com.example.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.example.domain.Criteria;
import com.example.domain.GroupVO;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.mapper_oracle.GroupMapper;
import com.example.mapper_oracle.GuMapper;
import com.example.mapper_oracle.MypageMapper;
import com.example.mapper_oracle.UserMapper;
import com.example.service.ClubService;
import com.example.service.GroupService;
import com.example.service.MasterService;

@Controller
public class MypageController {

	@Resource(name = "uploadPath")
	String path;
	
	@Autowired
	UserMapper umapper;

	@Autowired
	MypageMapper mapper;
	@Autowired
	MasterService mservice;
	
	@Autowired
	GuMapper gumapper;
	@Autowired
	GroupMapper gmapper;
	
	@Autowired
	ClubService cservice;
	@Autowired
	GroupService gservice;

	// 회원정보 수정page로 연결한다
	@RequestMapping("myPage_userUpdate")
	public void myPage_userUpdate(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("userVO",umapper.read(id) );
	}
	
//	1. model - 가장 기본이 되는 정보 이동 방식 / 컨트롤러에서 정보를 일방적으로 보냄. //  model.addAttreibute("vo",list); o
//		객체로 보낼 수가 있다.  list<UserVO>
//			여러 연관성 있는 정보를 묶어서 보낼때 용이하다.
//	2. session - session.get or setAttreibute / 정보를 보내기만 한다 그러나 sesstion을 선언한 모든 jsp에서 확인 가능하다. 즉 동이한 이름의 session이름을 사용할 수 없다. o
//		지금까지 사용한 적 없다.
//			하나의 정보씩 보내며 이후 모든 jsp에서 공통되게 사용하는 정보를 보낼때 용이하다.
//	3. ajax - @ResponsBody  / jsp에서 요청할때 정보만 url에 띄어주는 형식으로 보내준다. x
	
	// 내 정보 수정
	@RequestMapping(value = "myinfoUpdate", method = RequestMethod.POST)
	public String myinfoupdate(HttpSession session, UserVO vo, MultipartHttpServletRequest multi) throws Exception {
		String id = (String) session.getAttribute("id");

		// 사진 삭제 부분
		UserVO oldvo = mapper.myinfo(id);
		new File(path + "/" + oldvo.getImage()).delete();

		// 사진
		MultipartFile file = multi.getFile("file");
		if (file.isEmpty()) {
			vo.setImage("default.jpg");
		} else if (!file.isEmpty()) {
			String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setImage(image);
		}

		vo.setId(id);
		mapper.myinfoupdate(vo);
		return "redirect:/";
	}

	// 회원 탈티
	@RequestMapping(value = "removeUser")
	public String removeuser(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String id = (String) session.getAttribute("id");
		// session 삭제
		session.invalidate();
		// 쿠키삭제
		Cookie cookie1 = WebUtils.getCookie(request, "id");
		if (cookie1 != null) {
			cookie1.setPath("/");
			cookie1.setMaxAge(0);
			response.addCookie(cookie1);
		}
		mservice.mudelete(id);
		return "redirect:/";
	}

	// Mygroup 마이페이지에 연결
	@RequestMapping("myPage_club")
	public void myPage_club() {
	}

	// 내가 가입한 동아리 list를 보내준다._ 검색기능 포함
	@RequestMapping("myclubinfo")
	@ResponseBody
	public HashMap<String, Object> myclist(int page, Criteria cri,HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		cri.setId((String) session.getAttribute("id"));
		
		PageMaker pm = new PageMaker();
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.myctotalCount(cri));

		map.put("pm", pm);
		map.put("myclist", mapper.myclist(cri));
		return map;
	}

	// 동아리 탈퇴 및 삭제
	@RequestMapping(value = "removeclub")
	@ResponseBody
	public String removeclub(String c_code,HttpSession session) {
		String id = (String) session.getAttribute("id");
		cservice.deletemyClub(id,c_code);
		return "redirect:myclub";
	}

	
	// 관리자 group관리 page에 연결
	@RequestMapping("myPage_group")
	public void myPage_group(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("groupList", gumapper.getNotyetGrouplist(id));
	}

	// group list를 가져온다_ 검색기능까지 포함
	@RequestMapping("myglist")
	@ResponseBody
	public HashMap<String, Object> mYglist(int page, Criteria cri,HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		
		PageMaker pm = new PageMaker();
		cri.setId((String) session.getAttribute("id"));
		cri.setPage(page);
		pm.setCri(cri);
		pm.setTotalCount(mapper.mygtotalCount(cri));

		map.put("pm", pm);
		map.put("myglist", mapper.myglist(cri));

		return map;
	}

	// group을 삭제한다.
	@RequestMapping("removegroup")
	@ResponseBody
	public void removegroup(int g_code,HttpSession session) {
		String id = (String) session.getAttribute("id");
		gservice.deletemygroup(id, g_code);
	}
	
	// group 비밀번호를 확인한다.
	@ResponseBody
	@RequestMapping(value = "chkGroupPw", method = RequestMethod.POST)
	public int chkGroupPw(int g_code, String pw,HttpSession session){
		String id = (String) session.getAttribute("id");
		GroupVO vo = gmapper.gread(g_code);
		if(vo.getG_pass().equals(pw)){
			mapper.setGu_pwchk(id,g_code);
			return 0;
		}else{
			return 1;
		}	
	}
	
	// group을 승인하지 않고 삭제한다. 
	@RequestMapping("deleteGu")
	@ResponseBody
	public void deleteGu(int g_code,HttpSession session){
		String id = (String) session.getAttribute("id");
		gumapper.deleteMember(id, g_code);
	}
	
	
	
}