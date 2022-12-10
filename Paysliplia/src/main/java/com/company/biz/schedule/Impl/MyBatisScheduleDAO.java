package com.company.biz.schedule.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.biz.schedule.ScheduleVO;

@Repository
public class MyBatisScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate myBatisScheduleDAO;

	public List<ScheduleVO> getScheduleList(ScheduleVO vo) {
		System.out.println("mybatis getScheduleList 실행");
		return myBatisScheduleDAO.selectList("myBatisScheduleDAO.getScheduleList",vo);
	}
	
	public void insertSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.insert("myBatisScheduleDAO.insertSchedule", vo);
	}
	
	public void  updateSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.update("myBatisScheduleDAO.updateSchedule", vo);
	}
	
}
