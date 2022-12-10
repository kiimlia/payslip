package com.company.biz.schedule;

import java.util.List;

public interface ScheduleService {
	List<ScheduleVO> getScheduleList(ScheduleVO vo);
	
	void insertSchedule(ScheduleVO vo);
	
	void updateSchedule(ScheduleVO vo);
}
