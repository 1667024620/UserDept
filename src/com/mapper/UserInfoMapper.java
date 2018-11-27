package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.UserInfo;

public interface UserInfoMapper {

	UserInfo checkUserAccount(@Param("userAccount")String userAccount);

	UserInfo login(@Param("userAccount")String userAccount,
					@Param("password")String password);

	int selectAllCount(@Param("userAccount")String userAccount, 
					   @Param("deptid")Integer deptid);

	List<UserInfo> selectAll(@Param("userAccount")String userAccount, 
					   @Param("deptid")Integer deptid,
					   @Param("pageNum")int pageNum, 
					   @Param("pageSize")int pageSize);

	int insertUser(UserInfo info);

	int delete(@Param("userid")int userid);

	UserInfo selectId(@Param("userid")int userid);

	int updateUser(UserInfo info);

}
