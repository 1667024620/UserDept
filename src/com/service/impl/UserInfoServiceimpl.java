package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserInfoMapper;
import com.pojo.UserInfo;
import com.service.UserInfoService;
@Service
public class UserInfoServiceimpl implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public UserInfo checkUserAccount(String userAccount) {
		// TODO Auto-generated method stub
		return userInfoMapper.checkUserAccount(userAccount);
	}

	@Override
	public UserInfo login(String userAccount, String password) {
		// TODO Auto-generated method stub
		return userInfoMapper.login(userAccount,password);
	}

	@Override
	public int selectAllCount(String userAccount, Integer deptid) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectAllCount(userAccount,deptid);
	}

	@Override
	public List<UserInfo> selectAll(String userAccount, Integer deptid, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectAll(userAccount, deptid,(pageNum-1)*pageSize,pageSize);
	}

	@Override
	public int insertUser(UserInfo info) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertUser(info);
	}

	@Override
	public int delete(int userid) {
		// TODO Auto-generated method stub
		return userInfoMapper.delete(userid);
	}

	@Override
	public UserInfo selectId(int userid) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectId(userid);
	}

	@Override
	public int updateUser(UserInfo info) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateUser(info);
	}	
}
