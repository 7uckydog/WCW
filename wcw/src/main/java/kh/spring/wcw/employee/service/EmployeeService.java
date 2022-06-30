package kh.spring.wcw.employee.service;

import java.util.List;

import kh.spring.wcw.employee.domain.Employee;
import kh.spring.wcw.notice.domain.Notice;

/**
 *   ���� ���� 
 *   */
public interface EmployeeService {
	/**
	 * @param id(email), pwd
	 * @return ���� ����
	 * @author ybseo
	 */
	public Employee selectEmployee(String id, String password);
	
	/**
	 * @param cp_name(ȸ���), id(email), name(����)
	 * @return ���� ��й�ȣ ����
	 * @author ybseo
	 */
	public Employee selectEmployeePwd(String cp_name, String id, String name);

}
