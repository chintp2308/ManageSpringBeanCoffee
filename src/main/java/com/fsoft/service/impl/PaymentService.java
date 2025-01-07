package com.fsoft.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.entity.PaymentEntity;
import com.fsoft.repository.PaymentRepository;
import com.fsoft.service.IPaymentService;

@Service
public class PaymentService implements IPaymentService {
	@Autowired
	PaymentRepository paymentRepository;
	

	@Override
	public PaymentEntity savePayment(int paymentID) {
		// TODO Auto-generated method stub
		PaymentEntity paymentEntity = new PaymentEntity();
		if (paymentID == 1) {
			paymentEntity.setPaymentMethod(paymentID);
			paymentEntity.setPaymentName("Tiền Mặt");
			paymentEntity.setPaymentStatus(1);
		}
		return paymentRepository.save(paymentEntity);
	}

}
