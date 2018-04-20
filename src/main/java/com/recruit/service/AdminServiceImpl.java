package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.StatisticVO;
import com.recruit.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public BoardVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(AdminCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public BoardVO aread() throws Exception {
		return dao.aread();
	}

	@Override
	public void amodify(BoardVO vo) throws Exception {
		dao.aupdate(vo);
	}
	
	@Override
	public String readpw(BoardVO vo) throws Exception{
		return dao.readpw(vo);
	}
	
	@Override
	public int pcount()throws Exception{
		return dao.pcount();
	}
	
	@Override
	public int ccount()throws Exception{
		return dao.ccount();
	}

	@Override
	public List<StatisticVO> count_recruit() throws Exception{
		return dao.count_recruit();
	}
	
	@Override
	public List<StatisticVO> jobgroup_recruit() throws Exception{
		return dao.jobgroup_recruit();
	}
	
	@Override
	public List<StatisticVO> jobgroup2_recruit() throws Exception{
		return dao.jobgroup2_recruit();
	}
	
	@Override
	public List<StatisticVO> weekPerson() throws Exception{
		return dao.weekPerson();
	}
	
	@Override
	public List<StatisticVO> weekCompany() throws Exception{
		return dao.weekCompany();
	}
	
	@Override
	public void emailauth(BoardVO vo) throws Exception{
		dao.emailauth(vo);
	}
}