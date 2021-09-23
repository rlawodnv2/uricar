package com.media.dao;

import java.util.List;
import java.util.Map;

import com.media.dto.CfileDto;
import com.media.dto.CmemberDto;

public interface CmemberDao {
	
	public String getPwd(String id);
	
	public CmemberDto getCmemInfo(String id);
	
	public void cmemberInsert(CmemberDto member);
	
	public int cidCheck(String cid);
	
	public void proFileInsert(Map<String, String> pfmap);
	
	public List<CfileDto> getCfList(Integer cf_num);
	
	public String getOriName(String sysFileName);
	
	public void CmemberUpdate(CmemberDto member);
	
	public void fileDelete(Integer cf_num);


}
