package com.springmvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springmvc.domain.Address;
import com.springmvc.domain.Member;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping
	public String requestMemberList(Model model, HttpSession session) {
		List<Member> list = memberService.readAllMemberList();
		model.addAttribute("memberList",list);
		
		String team = (String) session.getAttribute("team");
		model.addAttribute("myteam",team);
		
		return "member";
	}
	

	
	@GetMapping("/all")
	   public String requestAllBooks(Model model) 
	   {
	      List<Member> list = memberService.readAllMemberList(); // 호출하니까 이동
	      System.out.println(list.get(0));
	      model.addAttribute("memberList", list);
	      return "member";
	   }
	
	   @GetMapping("/search")
	   public String requestProductById(@RequestParam("id") String memberId, Model model)
	   {
	      Member memberById = memberService.getMemberById(memberId);
	      model.addAttribute("m", memberById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

	      return "member";
	   }
	   
	   
	   //로그인
	   
	@GetMapping("/login")
	public String getLoginForm() {
		return "login";
	}
	   

	@PostMapping("/login")
	public String login(@RequestParam String memberId, @RequestParam String password,HttpServletRequest request, Model model, HttpSession session) {
		Member member = memberService.authenticate(memberId, password);
		System.out.println("login 컨트롤러");
		if(member!=null) {
			//session.setAttribute("member", member);
			session.setAttribute("memberId", member.getMemberId()); // memberId만 세션에 저장
			session.setAttribute("Name", member.getName());
			session.setAttribute("team", member.getTeam());
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}
		
	}
	
	   // 로그아웃
    @PostMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
    	String referer = request.getHeader("Referer");
        session.invalidate();
     // 세션에서 로그인 정보 삭제
       // session.removeAttribute("loggedInMember");
        
        //로그아웃 후 이전 페이지로 Redirect
        redirectAttributes.addFlashAttribute("previousPage", referer);
        return "redirect:/member/login";
    }
 
	   
	@GetMapping("/createmember")
	public String createMember(@ModelAttribute Member member, Model model) {
//		MemberService.CreateNewMember(Member);
		return "createMember";
	}
	
	@PostMapping("/createmember")
	public String submitCreateMember(@ModelAttribute Member member, HttpServletRequest request, Model model) {
		//MemberService.CreateNewMember(Member);
		
		/*
		 * if(memberService.isMemberId(member.getMemberId())) {
		 * model.addAttribute("error", "이미 사용중인 아이디 입니다."); return "createMember"; }
		 */
		
		
		if (member.getAddress() == null) {
	        member.setAddress(new Address());
	    }
		member.getAddress().setZipcode(request.getParameter("zipcode"));
		System.out.println(request.getParameter("zipcode"));
	    member.getAddress().setStreetAddress(request.getParameter("streetAddress"));
	    member.getAddress().setDetaileAddress(request.getParameter("detaileAddress"));
	    member.getAddress().setExtraAddress(request.getParameter("extraAddress"));

		
		MultipartFile img = member.getMemberImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save, saveName);
		
		if(img != null && !img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				member.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("프로필 이미지 업로드 실패.");
			}
		}
		
		System.out.println("SubmitCreateMember");
		System.out.println("id : " +member.getMemberId());
		System.out.println("pw : " +member.getPassword());
		System.out.println("birth : " +member.getBirth());		
		
		memberService.createNewMember(member);
		return "new";
	}
	
	@GetMapping("/updatemember")
	public String getUpdateMemberForm(@ModelAttribute("updateMember") Member member, @RequestParam("id") String memberId, Model model) {
		Member memberById = memberService.getMemberById(memberId);
		model.addAttribute("member",memberById);
		return "updateFrom";
	}
	
	@PostMapping("updatemember")
	public String submitUpdateMemberForm(@ModelAttribute("updateMember") Member member, HttpServletRequest request) {
		MultipartFile memberImage = member.getMemberImage();
		String saveName = memberImage.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save, saveName);
		
		if(memberImage != null && !memberImage.isEmpty()) {
			try {
				memberImage.transferTo(saveFile);
				member.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("Member Image saving failed", e);
			}
		}
		memberService.setUpdateMemeber(member);
		return "redirect:/member";
	}
	
	@GetMapping("/deletemember")
	public String deleteMember() {
		return "deleteMeber";
	}
}
