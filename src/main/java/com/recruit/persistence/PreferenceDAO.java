package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CRecruitVO;
import com.recruit.domain.CoordinateVO;
import com.recruit.domain.PreferenceVO;

public interface PreferenceDAO {
	
	//5가지에 대한 선호도
	public PreferenceVO selectPREFOne(String id)throws Exception;
	
	//해당 이력서에 대한 추천 채용공고 리스트
	public List<CoordinateVO> selectCoordinateList(int bno)throws Exception;
	
	//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	//public List<CRecruitVO> selectRecomendedList(List<CoordinateVO> top10)throws Exception;
	
	//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	public CRecruitVO selectRecomendedOne(CoordinateVO top10)throws Exception;
}
