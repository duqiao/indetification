package com.main.identification.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.identification.repository.ExpertRepository;
import com.main.identification.model.Expert;

/**
 * 专家Service
 * 
 * @author YangQi
 *
 */
@Service
public class ExpertService {
	@Autowired
	private ExpertRepository expertRepository;
	
	/**
	 * 申请查询
	 * 
	 * @param condition 检索条件
	 * @return 结果集
	 */
	public Expert selectByExpertNo(String expertNo){
		return expertRepository.selectByPK(expertNo);
	}

	/**
	 * 检索专家
	 * @param expert 专家内容
	 * @return
	 */
	public List<Expert> selectExpert(Expert expert){
		return expertRepository.selectExpert(expert);
	}
	
	/**
	 * 注册页面用专家数量
	 * @param expert 专家内容
	 * @return
	 */
	public int selectExpertCount(Expert expert){
		return expertRepository.selectExperCountForApplication(expert);
	}	
	
	
	/**
	 * 申请注册页面用 检索专家
	 * @param expert 专家内容
	 * @return
	 */
	public List<Expert> selectExpertForApplication(Expert expert){
		return expertRepository.selectExpertForApplication(expert);
	}		
}
