package com.company.view.worker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Controller
public class LoginController {
	
	@Autowired
	private WorkerService workerService;

	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String login(WorkerVO vo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		System.out.println("로그인 인증 요청." + vo.getWorker_id() + "," + vo.getPwd());
		if(vo.getWorker_id()==null || vo.getWorker_id().equals(""))
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		// 3. 화면 네비게이션
		if (workerService.getLoginWorker(vo) != null) {
			session.setAttribute("Worker_id", workerService.getLoginWorker(vo).getWorker_id());
			session.setAttribute("pwd", workerService.getLoginWorker(vo).getPwd());
			return "redirect:getScheduleList.do";
		} else {
			// 로그인 정보가 일치하지 않을때 

			out.print("<script>alert('로그인 정보가 일치하지 않습니다.');location.href='index.jsp';</script>");
			return null;
		}

	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
