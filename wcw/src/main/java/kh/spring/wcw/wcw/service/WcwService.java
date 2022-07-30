package kh.spring.wcw.wcw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.wcw.dao.WcwDao;
import kh.spring.wcw.wcw.domain.Wcw;

@Service
public class WcwService {

	@Autowired
	private WcwDao wcwdao;
	
	// �α��� ���
	public Wcw selectLogin(Wcw wcw) {
		return wcwdao.selectLogin(wcw);
	}
	
	// ��� ȸ�� ����
	public List<Company> selectCompanyList(){
		return wcwdao.selectCompanyList();
	}
	
	// ȸ�� ������Ʈ (���� ���� �� �ݷ� ó��)
	public int updateCompany(String cp_no, String type){
		return wcwdao.updateCompany(cp_no, type);
	}
}
