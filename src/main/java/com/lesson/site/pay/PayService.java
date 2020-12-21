package com.lesson.site.pay;

import java.util.List;

public interface PayService {
	
	/*	
		1. 결제내역 추가하기
		2. 결제내역 가져오기 -> 리스트로 해야하나 아니면 특정값만 가져와야 하나...둘다 하지 뭐
	*/	
	//결제내역 추가하기
	public int addPay(PayVO vo);
	//전체 결제내역 가져오기
	public List<PayVO> getPayList(); 
	
	
}








