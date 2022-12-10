package com.company.view.schedule;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;

@Controller
public class SchedulerController {
	
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("getScheduleList.do")
	public String getScheduleList(ScheduleVO vo, Model model, HttpSession session) {
		System.out.println("getScheduleList");
		model.addAttribute("scheduleList", scheduleService.getScheduleList(vo));
		
		return "main";
	}
	
	//스케줄등록매핑
	@ResponseBody
    @RequestMapping(value = "/addScheduleAjax.do", method = RequestMethod.POST)
    public boolean addScheduleAjax(@RequestBody ScheduleVO vo) {
		System.out.println("스케줄 등록 컨트롤러");
		scheduleService.insertSchedule(vo);
		
		return true;
    }
	
	//스케줄수정매핑
	@ResponseBody
    @RequestMapping(value = "/scheduleUpdateAjax.do", method = RequestMethod.POST)
	public boolean updateScheduleAjax(@RequestBody ScheduleVO vo) {
		System.out.println("스케줄 수정 컨트롤러");
		scheduleService.updateSchedule(vo);
		
		return true;
		
	}
}
