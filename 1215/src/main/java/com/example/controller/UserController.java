package com.example.controller;

import java.io.File;
import java.nio.file.Files;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.mapper_oracle.UserMapper;

@Controller
public class UserController {
   @Autowired
   UserMapper mapper;

   @Resource(name = "uploadPath")
   String path;

   @RequestMapping("index")
   public void index(){}


   // 회원가입
   @RequestMapping("signup")
   public void signup() {

   }

   @RequestMapping(value = "signup", method = RequestMethod.POST)
   public String signup(UserVO vo, MultipartHttpServletRequest multi) throws Exception {
      MultipartFile file = multi.getFile("file");
      if(file.isEmpty()){
         vo.setImage("default.jpg");
      }else if (!file.isEmpty()) {
         String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
         file.transferTo(new File(path + "/" + image));
         vo.setImage(image);
      } else {
         return "redirect:signup";
      }
      mapper.signup(vo);
      return "redirect:login";
   }

   // 로그인
   @RequestMapping("login")
   public String login(HttpSession session) {
	   if(session.getAttribute("dest") !=null){
		   
	   }   
	   return "login";
   }

   @ResponseBody
   @RequestMapping(value = "login.json", method = RequestMethod.POST)
   public int loginPost(UserVO vo, HttpSession session, boolean chkLogin, HttpServletResponse response) {
      UserVO resultVO = mapper.read(vo.getId());
      if (resultVO != null) {
         if (resultVO.getPw().equals(vo.getPw())) {
            session.setAttribute("image", resultVO.getImage());
            session.setAttribute("id", vo.getId());
            // GuVO gvo = gMapper.read(vo.getId());
            // session.setAttribute("gcode", gvo.getG_code());
            if (chkLogin) {
               Cookie cookie1 = new Cookie("id", vo.getId());
               // String gcode = ""+gvo.getG_code();
               // Cookie cookie2 = new Cookie("gcode", gcode);
               cookie1.setPath("/");
               cookie1.setMaxAge(60 * 60 * 24 * 7);
               // cookie2.setPath("/");
               // cookie2.setMaxAge(60 * 60 * 24 * 7);
               response.addCookie(cookie1);
               // response.addCookie(cookie2);
            }
            return 1;// 로그인 성공
         } else {
            return 2;// 비번이 틀렸을떄
         }
      }
      return 0;// 아이디가 없을떄
   }

   // 로그아웃
   @RequestMapping("logout")
   public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
      session.invalidate();
      // 쿠키삭제
      Cookie cookie1 = WebUtils.getCookie(request, "id");
      if (cookie1 != null) {
         cookie1.setPath("/");
         cookie1.setMaxAge(0);
         response.addCookie(cookie1);
      }
      // Cookie cookie2=WebUtils.getCookie(request, "gcode");
      // if(cookie1 != null){
      // cookie2.setPath("/");
      // cookie2.setMaxAge(0);
      // response.addCookie(cookie2);
      // }
      return "redirect:/";
   }

   // 이미지 출력
   @RequestMapping("display") // display?
   @ResponseBody
   public ResponseEntity<byte[]> display(String fileName) throws Exception {
      ResponseEntity<byte[]> result = null;
      // display fileName이 있는 경우
      if (!fileName.equals("")) {
         File file = new File(path + File.separator + fileName);
         HttpHeaders header = new HttpHeaders();
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
      }
      return result;
   }
   
   //아이디 중복 체크
   @RequestMapping(value = "idchk", method = RequestMethod.GET)
   @ResponseBody
   public int idchk(String id, Model model){
      if(mapper.idchk(id)==1){
         return 1; //사용 불가능
      }
      return 0; //사용 가능 
   }

}