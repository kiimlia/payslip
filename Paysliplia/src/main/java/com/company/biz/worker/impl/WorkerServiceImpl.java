package com.company.biz.worker.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Service("workerService")
public class WorkerServiceImpl implements WorkerService{
	
	@Autowired
	private WorkerMyBatisDAO workerMyBatisDAO;
	
	
	public WorkerVO getLoginWorker(WorkerVO vo) {
		return workerMyBatisDAO.getLoginWorker(vo);
	}

	@Override
	public List<WorkerVO> getWorkerList() {
		return workerMyBatisDAO.getWorkerList();
	}
	
	public void insertWorker(WorkerVO vo) {
		workerMyBatisDAO.insertWorker(vo);
	}
	@Override
	public WorkerVO getId(WorkerVO vo) {
		return workerMyBatisDAO.getId(vo);
	}

	@Override
	public WorkerVO getPwd(WorkerVO vo) {
		return workerMyBatisDAO.getPwd(vo);
	}
}
