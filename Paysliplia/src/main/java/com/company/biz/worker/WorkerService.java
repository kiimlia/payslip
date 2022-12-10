package com.company.biz.worker;

import java.util.List;

public interface WorkerService {

	WorkerVO getLoginWorker(WorkerVO vo);
	
	List<WorkerVO> getWorkerList();

	void insertWorker(WorkerVO vo);
	
	WorkerVO getId(WorkerVO vo);

	WorkerVO getPwd(WorkerVO vo);

}