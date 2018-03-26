package com.recruit.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;




@RestController
@RequestMapping("/companyAjax")
public class CompanyAjax {

	@Inject
	private CompanyAjaxService service;
	@Inject
	private CompanyService jobService;
	
	
	@RequestMapping(value = "/jobGroup", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list() {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.jobgroupList(), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	

	 
	@RequestMapping(value = "/jobGroup/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list(@PathVariable("id2") int id2) {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubJobGroup(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
	@RequestMapping(value = "/region/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<RegionVO>> region(@PathVariable("id2") String id2) {

	    ResponseEntity<List<RegionVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubRegion(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	@RequestMapping(value = "/personList/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<CPersonInfoVO>> personList(@PathVariable("bno") int bno, Model model){
	
		ResponseEntity<List<CPersonInfoVO>> entity = null;
		
		
		try {
			entity = new ResponseEntity<>(service.PersonRecomList(bno), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/favorList/", method = RequestMethod.GET)
	public ResponseEntity<List<CPersonInfoVO>> favList(HttpSession session, Model model){
		
		
		ResponseEntity<List<CPersonInfoVO>> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		String id = login.getId();
		try {
			entity = new ResponseEntity<>(jobService.FavorList(id), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	

	@RequestMapping(value = "/favorAdd/{bno}/{id}",method = RequestMethod.GET)
	public void faverAdd(@PathVariable("bno") int bno, @PathVariable("id") String id, RedirectAttributes rttr) throws Exception{
		service.FavorPersonAdd(bno, id);
	}
	
	@RequestMapping(value = "/favorDeleteRestart/{bno}",method = RequestMethod.GET)
	public String faverDeleteRestart(HttpSession session, @PathVariable("bno") int bno,  RedirectAttributes rttr) throws Exception{
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			System.out.println(id+""+bno);
			service.FavorPersonDelete(bno, id);
			
			rttr.addFlashAttribute("msg", "DELESUCCESS");
			
			return "/company/C_favor";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		
	}
	
	@RequestMapping(value = "/recruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> RecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.RecruitList(id), HttpStatus.OK);
				System.out.println("컨트롤러 제네릭 : "+entity.toString());
				
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	@RequestMapping(value = "/ingRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> IngRecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.IngRecruitList(id), HttpStatus.OK);
				System.out.println(entity.getBody().get(0));
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/endRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> EndRecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.EndRecruitList(id), HttpStatus.OK);
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}

	// 문> 3.26
	@Inject
	private PasswordEncoder passwordEncoder;

	// 문> 3.26 매개변수에 @RequestBody를 써줘야 ajax처리된 값을 가져올 수 있다. 
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public ResponseEntity<String> pwPost(@RequestBody LoginDTO dto, HttpSession session, Model model,
			HttpServletRequest request, RedirectAttributes rttr) {

		ResponseEntity<String> entity = null;

		BoardVO login = (BoardVO) session.getAttribute("login");

		System.out.println("하하하");

		System.out.println("★ login: " + login);

		System.out.println("★ login.getPw(): " + login.getPw());

		System.out.println("★ LoginDto: " + dto);
		
		System.out.println("★ dto.getPw(): " + dto.getPw());
		
		System.out.println("★ entity: " + entity);
		
		if (passwordEncoder.matches(dto.getPw(), login.getPw())) {
			System.out.println("★ 비밀번호 일치");
			System.out.println("★if안 entity: " + entity);
			try {
				entity = new ResponseEntity<>("success", HttpStatus.OK);
				System.out.println("★if안 try안 entity: " + entity);
				return entity;
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				return entity;
			}

		} else {
			System.out.println("★ 비밀번호 불일치");

		}

		return entity;

	}
	
	
	
}
	 
