package com.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pojo.Department;
import com.pojo.UserInfo;
import com.service.DepartmentService;
import com.service.UserInfoService;


@Controller
public class UserInfoController {
	@Autowired
    private UserInfoService userInfoService;
	@Autowired
    private DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/checkUserAccount")
	public String checkUserAccount(@RequestParam(value="userAccount",required=false) String userAccount,
			          Model model){
		UserInfo info = userInfoService.checkUserAccount(userAccount);
		if(info!=null){
			if(info.getUserAccount().equals(userAccount)){
				return "true";
			}
		}
		return "false";
	}
	
	@RequestMapping("login")
	public String login(@RequestParam(value="userAccount") String userAccount,
	          @RequestParam(value="password") String password
	          ,Model model){
		 UserInfo info = userInfoService.login(userAccount, password);
		 if(info!=null){
			 return "redirect:/chaxun"; 
			 
		 }else{
			 model.addAttribute("error","账户密码不正确");
			 return "index";
		 }
	}
	
	@RequestMapping("/chaxun")
	public String chaxun(@RequestParam(value="pageNum",required=false,defaultValue="1")String page_Num,
						 @RequestParam(value="userAccount",required=false,defaultValue="")String userAccount,
						 @RequestParam(value="deptid",required=false,defaultValue="0")String deptid,
						 Model model){
		int pageNum = 1;
		int pageSize = 4;
		if(page_Num!=null){
			pageNum= Integer.valueOf(page_Num);
		}
		int count =  userInfoService.selectAllCount(userAccount,Integer.valueOf(deptid));
		int pageTotal = count%pageSize==0?count/pageSize:count/pageSize+1;
		List<UserInfo> userInfoList = userInfoService.selectAll(userAccount,Integer.valueOf(deptid),pageNum,pageSize);
		List<Department> departmentList = departmentService.selectAll();
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("userAccount", userAccount);
		model.addAttribute("deptid", deptid);
		model.addAttribute("userInfoList", userInfoList);
		model.addAttribute("departmentList", departmentList);
		return "userlist";
	}
	
	@RequestMapping(value="/zhuce")
	public String zhuce(Model model){
		List<Department> departmentList = departmentService.selectAll();
		model.addAttribute("departmentList", departmentList);
		return "zhuce";
	}
	
	@RequestMapping(value="insertUserInfo")
	public String insertUserInfo(Model model,
			@RequestParam(value="path",required=false) MultipartFile multipartFile,
			UserInfo info,
			HttpSession session){
	    if(!multipartFile.isEmpty()){
	    	String path = session.getServletContext().getRealPath("/uploadFile");
            String fileName = System.currentTimeMillis()+"info.jpg";
	    	File file = new File(path,fileName);
	    	try {
	    	   multipartFile.transferTo(file);
	    	   info.setPathImage(fileName);
			} catch (Exception e) {
			   e.printStackTrace();
			   model.addAttribute("uploadError","文件上传失败");
		       return "zhuce";
			}
	    }
		int count = userInfoService.insertUser(info);
		if(count>0){
			model.addAttribute("uploadError", "添加成功");
			return "index";
		}else{
			model.addAttribute("uploadError", "添加失败");
			return "zhuce";
		}
	}
	
	
	@RequestMapping(value="delUser")
	@ResponseBody
	public String delUser(@RequestParam("userid") int userid,
							Model model){
		int count =  userInfoService.delete(userid);
		if(count>0){
			return "1";
		}else{
			return "0";
		}
	}
	
	@RequestMapping(value="selectuserid")
	public String selectUserid(@RequestParam("userid")int userid,
								Model model){
		UserInfo info = userInfoService.selectId(userid);
		List<Department> dept = departmentService.selectAll();
		model.addAttribute("dept",dept);
		model.addAttribute("info",info);
		return "update";
	}
	
	@RequestMapping(value="updateUser")
	public String updateUser(Model model,
			@RequestParam(value="path",required=false) MultipartFile multipartFile,
			@RequestParam(value="pathImage",required=false) String pathImage,
			UserInfo info,HttpSession session){
		 if(!multipartFile.isEmpty()){
		    	String path = session.getServletContext().getRealPath("/uploadFile");
	            String fileName = System.currentTimeMillis()+"info.jpg";
		    	File file = new File(path,fileName);
		    	try {
		    	   multipartFile.transferTo(file);
		    	   info.setPathImage(fileName);
				} catch (Exception e) {
				   e.printStackTrace();
				   model.addAttribute("uploadError","文件上传失败");
			       return "zhuce";
				}
		 }else{
			 info.setPathImage(pathImage);
		 }
		 int count = userInfoService.updateUser(info);
		 if(count>0){
				model.addAttribute("uploadError", "修改成功");
				return "redirect:/chaxun";
		 }else{
				model.addAttribute("uploadError", "修改失败");
				return "redirect:/selectuserid";
		}
	}
}
