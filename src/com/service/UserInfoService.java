package com.service;

import java.util.List;

import com.pojo.UserInfo;

public interface UserInfoService {

	UserInfo checkUserAccount(String userAccount);

	UserInfo login(String userAccount, String password);

	int selectAllCount(String userAccount, Integer deptid);

	List<UserInfo> selectAll(String userAccount, Integer deptid, int pageNum, int pageSize);

	int insertUser(UserInfo info);

	int delete(int userid);

	UserInfo selectId(int userid);

	int updateUser(UserInfo info);

}
