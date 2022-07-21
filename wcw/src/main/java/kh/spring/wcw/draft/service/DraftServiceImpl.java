package kh.spring.wcw.draft.service;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.draft.dao.DraftDao;
import kh.spring.wcw.draft.domain.Draft;
import kh.spring.wcw.employee.domain.Employee;

@Service
public class DraftServiceImpl implements DraftService {
	@Autowired
	private DraftDao dao;
	
	// ���� ����Ʈ ��ȸ
	@Override
	public List<Employee> selectEmployeeList(int cp_no) {
		return dao.selectEmployeeList(cp_no);
	}
	
	// ��� �ۼ�
	@Override
	public int insertDraft(Draft draft) {
		return dao.insertDraft(draft);
	}
	
	// ��� ����Ʈ ��ȸ
	@Override
	public List<Draft> selectListDraft(int ep_no, RowBounds rowBounds){
		return dao.selectListDraft(ep_no, rowBounds);
	}

	// ��� �� ����
	@Override
	public List<Draft> selectDraft(int dr_no, int dr_sort){
		return dao.selectDraft(dr_no, dr_sort);
	}
}
