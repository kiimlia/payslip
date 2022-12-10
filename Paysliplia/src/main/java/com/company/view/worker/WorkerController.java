package com.company.view.worker;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Controller
public class WorkerController {
	
	@Autowired
	private WorkerService workerService;

	@RequestMapping(value="/getWorkerList.do",method = RequestMethod.GET)
	public String getWorkerList(WorkerVO vo, Model model, HttpSession session) {
		
		System.out.println("getWorkerList");
		model.addAttribute("workerList", workerService.getWorkerList());
		
		return "workerList";

	}
	@RequestMapping(value="/schedulePay_Cal.do",method = RequestMethod.GET)
	public String schedulePay_Cal(WorkerVO vo, Model model, HttpSession session) {
		
		System.out.println("schedulePay_Cal");
		model.addAttribute("workerList", workerService.getWorkerList());
		
		return "schedulePay_Cal";

	}
	
	@ResponseBody
    @RequestMapping(value = "/addWorkerAjax.do", method = RequestMethod.POST)
    public boolean addWorkerAjax(@RequestBody WorkerVO vo) {
		
		workerService.insertWorker(vo);
		
		return true;
    }
		
	    // 아이디 찾기 실행
		@RequestMapping(value="find_id.do", method=RequestMethod.POST)
		public String getId(WorkerVO vo, Model model) {
			System.out.println("getId controller");
			WorkerVO worker = workerService.getId(vo);
			System.out.println(worker);
			if(worker == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("id", worker.getWorker_id());
			}
			
			return "workerGetId";
		}
		//비밀번호 찾기
		@RequestMapping(value="find_password.do", method=RequestMethod.POST)
		public String findPasswordAction(WorkerVO vo, Model model) {
			WorkerVO worker = workerService.getPwd(vo);
			
			if(worker == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("pwd", worker.getPwd());
			}
			
			return "workerGetPwd";
		}
	 

}
