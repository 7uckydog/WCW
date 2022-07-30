package kh.spring.wcw.wcw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.wcw.domain.Wcw;

@Repository
public class WcwDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	// �α��� ���
	public Wcw selectLogin(Wcw wcw) {
		return sqlsession.selectOne("wcwMapper.selectLogin", wcw);
	}
	
	// ��� ȸ�� ����
	public List<Company> selectCompanyList(){
		return sqlsession.selectList("wcwMapper.selectCompanyList");
	}
	
	// ȸ�� ������Ʈ (���� ���� �� �ݷ� ó��)
	public int updateCompany(String cp_no, String type) {
		Integer.parseInt(type);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cp_no", cp_no);
		map.put("type", type);
		return sqlsession.update("wcwMapper.updateCompany", map);
	}
}
