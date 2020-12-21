package com.lesson.site.pay.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.pay.PayVO;

@Repository
public class PayDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

	public int addPay(PayVO vo) {
		return mybatis.insert("pay.addPay", vo);
	}

	public List<PayVO> getPayList() {
		return mybatis.selectList("pay.getPayList");
	}
	
	
	
}





