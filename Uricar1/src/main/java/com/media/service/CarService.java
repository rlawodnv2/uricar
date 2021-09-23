package com.media.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.media.dao.CarDao;
import com.media.dto.CarDto;
import com.media.dto.CfileDto;
import com.media.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class CarService {
	
	
	@Autowired
	private CarDao cDao;

	ModelAndView mv;
	
	@Autowired
	private HttpSession session;
	
	private int listCount = 5;
	private int pageCount = 2;

	
//	public ModelAndView carInsert(CarDto car, RedirectAttributes rttr) {
//		mv = new ModelAndView();
//		String view = null;
//		
//		try {
//			cDao.carInsert(car);
//			//차량 등록 성공 -> 기업정보페이지로 전환
//			view = "redirect:/";
//			rttr.addFlashAttribute("msg", "등록 성공");
//		} catch (Exception e) {
//			// TODO: handle exception
//			view = "redirect:carInsertFrm";
//			rttr.addAttribute("msg", "중복 차량");
//		}
//		
//		mv.setViewName(view);
//		return mv;
//	}
	
	public String carNumCheck(String carnum) {
		String result = null;
		
		try {
			int cnt = cDao.carNumCheck(carnum);
			
			if(cnt == 1) {
				result = "fail";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ModelAndView getCarList(Integer pageNum) {
		// TODO Auto-generated method stub
		log.info("getCarList() - pageNum : " + pageNum);
		
		mv = new ModelAndView();
		
		int num = (pageNum == null) ? 1 : pageNum;
		
		Map<String, String> lmap = new HashMap<String, String>();
		
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));
		
		List<CarDto> cbList = cDao.getList(lmap);
		
		mv.addObject("cbList", cbList);
		
		String paging = getPaging(num);
		mv.addObject("paging", paging);
		
		session.setAttribute("pageNum", num);
		
		mv.setViewName("cmPage");
		return mv;
	}
	
	private String getPaging(int num) {
		int maxNum = cDao.getCarCount();
		String listName = "clist";
		
		Paging paging = new Paging(maxNum, num, listCount, pageCount, listName);
		
		String pagingHtml = paging.makePaging();
		
		return pagingHtml;
	}

	public ModelAndView getContents(Integer cbnum) {
		// TODO Auto-generated method stub
		mv = new ModelAndView();
		
		CarDto car = cDao.getContents(cbnum);
		mv.addObject("car", car);
		
		List<CfileDto> CfileList = cDao.getCfList(cbnum);
		mv.addObject("cfList", CfileList);
		
		return mv;
	}
	
	
	
	@Transactional
	public String carInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		
		String carnum = multi.getParameter("carnum");
		String contents = multi.getParameter("ccontents");
		int fcheck = Integer.parseInt(multi.getParameter("fileCheck"));
		String id = multi.getParameter("cid");
		
		contents = contents.trim();
		
		CarDto car = new CarDto();
		car.setCm_id(id);
		car.setCar_num(carnum);
		car.setCar_option(contents);
		
		try {
			cDao.carInsert(car);
			view = "redirect:clist";
			rttr.addFlashAttribute("check", 2);
			
			log.info("carInsert - filecheck: " + fcheck);
			if(fcheck == 1) {
				
				fileUp(multi, car.getCbnum());
			}
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:writeFrm";
			rttr.addFlashAttribute("check", 1);
		}
		return view;
		
	}
	private void fileUp(MultipartHttpServletRequest multi, int cbnum) throws IllegalStateException, IOException {
		
		String path = multi.getSession()
				.getServletContext()
				.getRealPath("/") + "resources/upload/";
		log.info(path);
		
		File folder = new File(path);
		if(folder.isDirectory() == false) {
			folder.mkdir();
		}
	
		Map<String, String> fmap = new HashMap<String, String>();
		
		List<MultipartFile> fList = multi.getFiles("files");
		
		for(int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			
			String oriName = mf.getOriginalFilename();
			
			fmap.put("oriFileName", oriName);
			
			String sysName = System.currentTimeMillis()
					+ "."
					+ oriName.substring(oriName.lastIndexOf(".") + 1);
			
			mf.transferTo(new File(path+sysName));
			
			cDao.fileInsert(fmap);
		}
	}
	
	public void fileDown(String sysFileName, HttpServletRequest req, HttpServletResponse resp) {
		
		String path = req.getSession().getServletContext().getRealPath("/") + "resources/upload/";
		
		String oriName = cDao.getOriName(sysFileName);
		
		path += sysFileName;
		
		InputStream is = null;
		OutputStream os = null;
		
		try {
			String dFileName = URLEncoder.encode(oriName, "UTF-8");
			
			File file = new File(path);
			is = new FileInputStream(path);
			
			resp.setContentType("application/octet-stream");
			resp.setHeader("content-Disposition", "attachment; filename=\""+ dFileName+"\"");
			
			os = resp.getOutputStream();
			
			byte[] buffer = new byte[1024];
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				os.flush();
				os.close();
				is.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	@Transactional
	public String carUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		
		String id = multi.getParameter("cid");
		String carnum = multi.getParameter("carnum");
		String contents = multi.getParameter("ccontent");
		int cbnum = Integer.parseInt(multi.getParameter("cbnum"));
		
		CarDto car = new CarDto();
		car.setCm_id(id);
		car.setCar_num(carnum);
		car.setCar_option(contents);
		car.setCbnum(cbnum);
		
		try {
			cDao.carUpdate(car);
			view = "redirect:contents?cbnum="+cbnum;
			rttr.addFlashAttribute("Check", 2);
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:contents?cbnum="+cbnum;
			rttr.addFlashAttribute("check", 3);
		}
		return view;
	}
	
	@Transactional
	public String deleteContents(Integer cbnum, RedirectAttributes rttr) {
		String view = null;
		
		try {
			cDao.fileDelete(cbnum);
			
			cDao.contentsDelete(cbnum);
			
			view = "redirect:clist";
			rttr.addFlashAttribute("check", 3);
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:contents?cbnum=" + cbnum;
			rttr.addFlashAttribute("check", 4);
		}
		
		return view;
	}
	
	

	public ModelAndView getUpContents(Integer cnum) {
		// TODO Auto-generated method stub
		mv = new ModelAndView();
		CarDto car = cDao.getContents(cnum);
		mv.addObject("car", car);
		return mv;
	}
	
}
