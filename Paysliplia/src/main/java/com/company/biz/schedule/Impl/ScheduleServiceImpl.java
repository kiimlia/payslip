package com.company.biz.schedule.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;

@Service("ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private MyBatisScheduleDAO myBatisScheduleDAO;

	@Override
	public List<ScheduleVO> getScheduleList(ScheduleVO vo) {
		return myBatisScheduleDAO.getScheduleList(vo);
	}

	@Override
	public void insertSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.insertSchedule(vo);
	}

	@Override
	public void updateSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.updateSchedule(vo);
	}

}
