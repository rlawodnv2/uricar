package com.media.dao;

import java.util.*;

import com.media.dto.CarDto;
import com.media.dto.CfileDto;

public interface CarDao {
	
	public List<CarDto> getList(Map<String, String> lmap);
	
	public int getCarCount();
	
	public CarDto getContents(Integer cnum);
	
	public CarDto getCarInfo(String carnum);

	public void carInsert(CarDto car) ;
	
	public void fileInsert(Map<String, String> fmap);
	
	public List<CfileDto> getCfList(Integer cnum);
	
	public String getOriName(String stsFileName);
	
	public void carUpdate(CarDto car);
	
	public void carDelete(CarDto car);
	
	public void contentsDelete(Integer cbnum);
	
	public void fileDelete(Integer cbnum);

	public int carNumCheck(String carnum);

}
