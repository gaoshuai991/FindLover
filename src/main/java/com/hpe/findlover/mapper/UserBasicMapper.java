package com.hpe.findlover.mapper;

import com.hpe.findlover.model.UserBasic;
import com.hpe.util.BaseTkMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface UserBasicMapper extends BaseTkMapper<UserBasic> {
	UserBasic selectByEmail(String email);
	List<UserBasic> selectAllByIdentity(@Param("identity") String identity);
}