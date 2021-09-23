package com.media.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.service.CarService;

import lombok.extern.java.Log;

@Controller
@Log
public class CarController {
	
	@Autowired
	private CarService cServ;
	
	ModelAndView mv;
	
	@GetMapping("clist")
	public ModelAndView carList(Integer pageNum) {
		log.info("carList()");
		
		mv = cServ.getCarList(pageNum);
		
		return mv;
	}
	
	@GetMapping("contents")
	public ModelAndView carContents(Integer cbnum) {
		log.info("carContents - cbnum:" + cbnum);
		
		mv = cServ.getContents(cbnum);
		
		return mv;
	}
	
	@GetMapping("carInsert")
	public String carInsert() {
		log.info("carInsert()");
		
		return "carInsert";
	}
	
	@PostMapping("carWrite")
	public String carWrite
	(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		log.info("carWrite()");
		
		String view = cServ.carInsert(multi, rttr);
		
		return view;
	}
	
	@GetMapping("cdownload")
	public void fileDownload(String sysFileName,HttpServletRequest req, HttpServletResponse resp) {
		log.info("download(); - sysFileName : " + sysFileName);
		
		cServ.fileDown(sysFileName, req, resp);
	}
	
	@GetMapping("updateCar")
	public ModelAndView carUpdateFrm(Integer cbnum) {
		log.info("updateCar - cbnum : " + cbnum);
		
		mv = cServ.getUpContents(cbnum);
		
		return mv;
	}
	
	@PostMapping("carUpdate")
	public String carUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = cServ.carUpdate(multi, rttr);
		
		return view;
	}
	
	@GetMapping("deleted")
	public String carDelete(Integer cbnum, RedirectAttributes rttr) {
		log.info("carDelete - cbnum : " + cbnum);
		
		String view = cServ.deleteContents(cbnum, rttr);
		
		return view;
	}

}
