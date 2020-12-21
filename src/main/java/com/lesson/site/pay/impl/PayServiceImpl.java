package com.lesson.site.pay.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.pay.PayService;
import com.lesson.site.pay.PayVO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	PayDAO payDAO;
	
	//결제내역 추가하기
	@Override
	public int addPay(PayVO vo) {
		return payDAO.addPay(vo);
	}
	//결제내역 전체 가져오기
	@Override
	public List<PayVO> getPayList() {
		return payDAO.getPayList();
	}
	
	
	
	
}





